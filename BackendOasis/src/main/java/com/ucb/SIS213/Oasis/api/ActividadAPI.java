package com.ucb.SIS213.Oasis.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ucb.SIS213.Oasis.bl.ActividadBl;
import com.ucb.SIS213.Oasis.dto.ResponseDTO;
import com.ucb.SIS213.Oasis.entity.Actividad;

import java.util.List;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/api/v1/actividad")
public class ActividadAPI {

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(ActividadAPI.class);

    ActividadBl actividadBl;

    @Autowired
    public ActividadAPI(ActividadBl actividadBl) {
        this.actividadBl = actividadBl;
    }

    // Endpoint para obtener todas las actividades
    @GetMapping
    public ResponseDTO getAllActividades() {
        List<Actividad> actividadList;
        try{
            actividadList = actividadBl.getAllActividad();
            LOGGER.info("Actividades encontradas");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener las actividades");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(actividadList);
    }

    // Endpoint para obtener una actividad por su id
    @GetMapping("/{id}")
    public ResponseDTO getActividadById(@PathVariable Long id) {
        Actividad actividad;
        try{
            actividad = actividadBl.getActividadById(id);
            LOGGER.info("Actividad encontrada");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener la actividad");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(actividad);
    }

    // Endpoint para crear una actividad
    @PostMapping("/create")
    public ResponseDTO createActividad(@RequestBody Actividad actividad) {
        Actividad actividadCreada;

        try{
            actividadCreada = actividadBl.createActividad(actividad);
            LOGGER.info("Actividad creada");
        } catch (RuntimeException e){
            LOGGER.error("Error al crear la actividad");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(actividadCreada);
    }

    // Endpoint para actualizar una actividad
    @PutMapping("/update/{id}")
    public ResponseDTO updateActividadById(@PathVariable Long id, @RequestBody Actividad actividad) {
        Actividad actividadActualizada;
        try{
            actividadActualizada = actividadBl.updateActividadById(id, actividad);
            LOGGER.info("Actividad actualizada");
        } catch (RuntimeException e){
            LOGGER.error("Error al actualizar la actividad");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(actividadActualizada);
    }

    // Endpoint para eliminar una actividad
    @DeleteMapping("/delete/{id}")
    public ResponseDTO deleteActividad(@PathVariable Long id) {
        try{
            actividadBl.deleteActividadById(id);
            LOGGER.info("Actividad eliminada");
        } catch (RuntimeException e){
            LOGGER.error("Error al eliminar la actividad");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO("Actividad eliminada");
    }
}
