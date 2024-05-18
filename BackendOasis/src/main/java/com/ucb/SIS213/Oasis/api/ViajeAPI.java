package com.ucb.SIS213.Oasis.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ucb.SIS213.Oasis.bl.ViajeBl;
import com.ucb.SIS213.Oasis.dto.ResponseDTO;
import com.ucb.SIS213.Oasis.entity.Viaje;

import java.util.List;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/api/v1/viaje")
public class ViajeAPI {

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(ViajeAPI.class);

    ViajeBl viajeBl;

    @Autowired
    public ViajeAPI(ViajeBl viajeBl) {
        this.viajeBl = viajeBl;
    }

    // Endpoint para obtener todos los viajes
    @GetMapping
    public ResponseDTO getAllViajes() {
        List<Viaje> viajeList;
        try{
            viajeList = viajeBl.getAllViaje();
            LOGGER.info("Viajes encontrados");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener los viajes");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(viajeList);
    }

    // Endpoint para obtener un viaje por su id
    @GetMapping("/{id}")
    public ResponseDTO getViajeById(@PathVariable Long id) {
        Viaje viaje;
        try{
            viaje = viajeBl.getViajeById(id);
            LOGGER.info("Viaje encontrado");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener el viaje");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(viaje);
    }

    // Endpoint para crear un viaje
    @PostMapping("/create")
    public ResponseDTO createViaje(@RequestBody Viaje viaje) {
        Viaje viajeCreado;

        try{
            viajeCreado = viajeBl.createViaje(viaje);
            LOGGER.info("Viaje creado");
            return new ResponseDTO(viajeCreado);
        } catch (RuntimeException e){
            LOGGER.error("Error al crear el viaje");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
    }

    // Endpoint para modificar un viaje por su id
    @PutMapping("/update/{id}")
    public ResponseDTO updateViaje(@PathVariable Long id, @RequestBody Viaje viaje) {
        Viaje viajeActualizado;
        try{
            viajeActualizado = viajeBl.updateViajeById(id, viaje);
            LOGGER.info("Viaje actualizado");
            return new ResponseDTO(viajeActualizado);
        } catch (RuntimeException e){
            LOGGER.error("Error al actualizar el viaje");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
    }

    // Endpoint para eliminar un viaje
    @DeleteMapping("/delete/{id}")
    public ResponseDTO deleteViaje(@PathVariable Long id) {
        try{
            viajeBl.deleteViajeById(id);
            LOGGER.info("Viaje eliminado");
            return new ResponseDTO("Viaje eliminado");
        } catch (RuntimeException e){
            LOGGER.error("Error al eliminar el viaje");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
    }
}
