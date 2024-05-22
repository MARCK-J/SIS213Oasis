package com.ucb.SIS213.Oasis.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "hotel")
public class Hotel {

    /*
    CREATE TABLE Hotel (
       idHotel serial  NOT NULL,
       hotel varchar(45)  NOT NULL,
       puntuacion int  NOT NULL,
       Ciudad_idCiudad int  NOT NULL,
       CategoriaHotel_idCatHot int  NOT NULL,
       totalHabitaciones int  NOT NULL,
       CONSTRAINT Hotel_pk PRIMARY KEY (idHotel)
    );
     */

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idhotel")
    private Long idHotel;

    @Column(name = "hotel")
    private String hotel;

    @Column(name = "puntuacion")
    private int puntuacion;

    @Column(name = "ciudad_idciudad")
    private int idCiudad;

    @Column(name = "categoriahotel_idcathot")
    private int idCatHot;

    @Column(name = "totalhabitaciones")
    private int totalHabitaciones;

    // Getters and Setters

    public Long getIdHotel() {
        return idHotel;
    }

    public void setIdHotel(Long idHotel) {
        this.idHotel = idHotel;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public int getIdCatHot() {
        return idCatHot;
    }

    public void setIdCatHot(int idCatHot) {
        this.idCatHot = idCatHot;
    }

    public int getTotalHabitaciones() {
        return totalHabitaciones;
    }

    public void setTotalHabitaciones(int totalHabitaciones) {
        this.totalHabitaciones = totalHabitaciones;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "idHotel=" + idHotel +
                ", hotel='" + hotel + '\'' +
                ", puntuacion=" + puntuacion +
                ", idCiudad=" + idCiudad +
                ", idCatHot=" + idCatHot +
                ", totalHabitaciones=" + totalHabitaciones +
                '}';
    }
}
