package com.civa.buses.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Bus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String numeroBus;
    private String placa;

    @Column(name = "fecha_creacion")
    private LocalDate fechaCreacion;

    private String caracteristicas;

    private boolean activo;

    @ManyToOne
    @JoinColumn(name = "marca_id")
    private Marca marca;

    @PrePersist
    public void prePersist() {
        fechaCreacion = LocalDate.now(); 
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getNumeroBus() {
        return numeroBus;
    }

    public String getPlaca() {
        return placa;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public boolean isActivo() {
        return activo;
    }

    public Marca getMarca() {
        return marca;
    }
}