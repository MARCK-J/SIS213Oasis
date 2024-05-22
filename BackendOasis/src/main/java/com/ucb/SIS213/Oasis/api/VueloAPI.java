package com.ucb.SIS213.Oasis.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ucb.SIS213.Oasis.bl.VueloBl;
import com.ucb.SIS213.Oasis.dto.ResponseDTO;
import com.ucb.SIS213.Oasis.entity.Vuelo;
import com.ucb.SIS213.Oasis.exep.UserException;

import java.util.List;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/api/v1/vuelo")
public class VueloAPI {

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(VueloAPI.class);

    VueloBl vueloBl;

    @Autowired
    public VueloAPI(VueloBl vueloBl) {
        this.vueloBl = vueloBl;
    }

    // Endpoint para obtener todos los vuelos
    @GetMapping
    public ResponseDTO getAllVuelos() {
        List<Vuelo> vueloList;
        try{
            vueloList = vueloBl.getAllVuelo();
            LOGGER.info("Vuelos encontrados");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener los vuelos");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(vueloList);
    }

    // Endpoint para obtener un vuelo por su id
    @GetMapping("/{id}")
    public ResponseDTO getVueloById(@PathVariable Long id) {
        Vuelo vuelo;
        try{
            vuelo = vueloBl.getVueloById(id);
            LOGGER.info("Vuelo encontrado");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener el vuelo");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(vuelo);
    }

    // Endpoint para crear un vuelo
    @PostMapping("/create")
    public ResponseDTO createVuelo(@RequestBody Vuelo vuelo) {
        Vuelo vueloCreado;
        try{
            vueloCreado = vueloBl.createVuelo(vuelo);
            LOGGER.info("Vuelo creado");
        } catch (RuntimeException e){
            LOGGER.error("Error al crear el vuelo");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(vueloCreado);
    }

    // Endpoint para modificar un vuelo por su id
    @PutMapping("/update/{id}")
    public ResponseDTO updateVuelo(@PathVariable Long id, @RequestBody Vuelo vuelo) {
        Vuelo vueloActualizado;
        try{
            vueloActualizado = vueloBl.updateVueloById(id, vuelo);
            LOGGER.info("Vuelo actualizado");
        } catch (RuntimeException e){
            LOGGER.error("Error al actualizar el vuelo");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(vueloActualizado);
    }

    // Endpoint para eliminar un vuelo
    @DeleteMapping("/delete/{id}")
    public ResponseDTO deleteVuelo(@PathVariable Long id) {
        try{
            vueloBl.deleteVuelo(id);
            LOGGER.info("Vuelo eliminado");
        } catch (RuntimeException e){
            LOGGER.error("Error al eliminar el vuelo");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO("Vuelo eliminado");
    }
}
