package com.ucb.SIS213.Oasis.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ucb.SIS213.Oasis.bl.AtraccionBl;
import com.ucb.SIS213.Oasis.dto.ResponseDTO;
import com.ucb.SIS213.Oasis.entity.Atraccion;

import java.util.List;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/api/v1/atraccion")
public class AtraccionAPI {

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(AtraccionAPI.class);

    AtraccionBl atraccionBl;

    @Autowired
    public AtraccionAPI(AtraccionBl atraccionBl) {
        this.atraccionBl = atraccionBl;
    }

    // Endpoint para obtener todas las atracciones
    @GetMapping
    public ResponseDTO getAllAtracciones() {
        List<Atraccion> atraccionList;
        try{
            atraccionList = atraccionBl.getAllAtraccion();
            LOGGER.info("Atracciones encontradas");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener las atracciones");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(atraccionList);
    }

    // Endpoint para obtener una atraccion por su id
    @GetMapping("/{id}")
    public ResponseDTO getAtraccionById(@PathVariable Long id) {
        Atraccion atraccion;
        try{
            atraccion = atraccionBl.getAtraccionById(id);
            LOGGER.info("Atraccion encontrada");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener la atraccion");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(atraccion);
    }

    // Endpoint para crear una atraccion
    @PostMapping("/create")
    public ResponseDTO createAtraccion(@RequestBody Atraccion atraccion) {
        Atraccion atraccionCreada;

        try{
            atraccionCreada = atraccionBl.createAtraccion(atraccion);
            LOGGER.info("Atraccion creada");
        } catch (RuntimeException e){
            LOGGER.error("Error al crear la atraccion");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(atraccionCreada);
    }

    // Endpoint para actualizar una atraccion
    @PutMapping("/update/{id}")
    public ResponseDTO updateAtraccionById(@PathVariable Long id, @RequestBody Atraccion atraccion) {
        Atraccion atraccionActualizada;

        try {
            atraccionActualizada = atraccionBl.updateAtraccionById(id, atraccion);
            LOGGER.info("Atraccion actualizada");
        } catch (RuntimeException e) {
            LOGGER.error("Error al actualizar la atraccion");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(atraccionActualizada);
    }

    // Endpoint para eliminar una atraccion
    @DeleteMapping("/delete/{id}")
    public ResponseDTO deleteAtraccionById(@PathVariable Long id) {
        try {
            atraccionBl.deleteAtraccionById(id);
            LOGGER.info("Atraccion eliminada");
        } catch (RuntimeException e) {
            LOGGER.error("Error al eliminar la atraccion");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO("Atraccion eliminada");
    }
}
