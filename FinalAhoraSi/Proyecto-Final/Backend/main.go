package main

import (
	//"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"

	"proyecto-final/controllers"
	"proyecto-final/handlers"
	"proyecto-final/models"
	repositorio "proyecto-final/repository"

	"github.com/gorilla/mux"
	"github.com/jmoiron/sqlx"
	"github.com/lib/pq"
)


func ConectarDB(url, driver string) (*sqlx.DB, error) {
	pgUrl, _ := pq.ParseURL(url)
	db, err := sqlx.Connect(driver, pgUrl) // driver: postgres
	if err != nil {
		log.Printf("fallo la conexion a PostgreSQL, error: %s", err.Error())
		return nil, err
	}

	log.Printf("Nos conectamos bien a la base de datos db: %#v", db)
	return db, nil
}


func main() {
	/* creando un objeto de conexión a PostgreSQL */
	db, err := ConectarDB(fmt.Sprintf("postgres://%s:%s@db:%s/%s?sslmode=disable", os.Getenv("DB_USER"),
		os.Getenv("DB_PASSWORD"), os.Getenv("DB_PORT"), os.Getenv("DB_NAME")), "postgres")
	if err != nil {
		log.Fatalln("error conectando a la base de datos", err.Error())
		return
	}

	
	/* creando una instancia del tipo Repository del paquete repository
	se debe especificar el tipo de struct que va a manejar la base de datos
	para este ejemplo es Amigo y se le pasa como parámetro el objeto de
	conexión a PostgreSQL */
	repo, err := repositorio.NewRepository[models.Usuario](db)
	if err != nil {
		log.Fatalln("fallo al crear una instancia de repositorio", err.Error())
		return
	}

	controller, err := controllers.NewController(repo)
	if err != nil {
		log.Fatalln("fallo al crear una instancia de controller", err.Error())
		return
	}

	handler, err := handlers.NewHandler(controller)
	if err != nil {
		log.Fatalln("fallo al crear una instancia de handler", err.Error())
		return
	}

	carRepo := repositorio.NewCarRepository(db)
    carController := controllers.NewCarController(carRepo)
    carHandler := handlers.NewCarHandler(carController)

	/* router (multiplexador) a los endpoints de la API (implementado con el paquete gorilla/mux) */
	r := mux.NewRouter()
	

	r.Handle("/usuarios", http.HandlerFunc(handler.ListarUsuarios)).Methods(http.MethodGet)
	r.Handle("/usuarios", http.HandlerFunc(handler.CrearUsuario)).Methods(http.MethodPost)
	r.Handle("/usuarios/{id}", http.HandlerFunc(handler.TraerUsuario)).Methods(http.MethodGet)
	r.Handle("/usuarios/{id}", http.HandlerFunc(handler.ActualizarUsuario)).Methods(http.MethodPatch)
	r.Handle("/usuarios/{id}", http.HandlerFunc(handler.EliminarUsuario)).Methods(http.MethodDelete)
	r.Handle("/cars", http.HandlerFunc(carHandler.GetCars)).Methods(http.MethodGet)
	r.HandleFunc("/cars", carHandler.GetCars).Methods(http.MethodGet)
	

	log.Fatal(http.ListenAndServe(":8080", r))
}
