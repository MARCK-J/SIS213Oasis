package com.ucb.SIS213.Oasis.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ucb.SIS213.Oasis.bl.ClienteBl;
import com.ucb.SIS213.Oasis.dto.LoginRequestDTO;
import com.ucb.SIS213.Oasis.dto.ResponseDTO;
import com.ucb.SIS213.Oasis.entity.Cliente;
import com.ucb.SIS213.Oasis.exep.UserException;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/api/v1/cliente")
public class ClienteAPI {

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(ClienteAPI.class);

    ClienteBl clienteBl;

    @Autowired
    public ClienteAPI(ClienteBl clienteBl) {
        this.clienteBl = clienteBl;
    }

    // Endpoint para obtener todos los clientes
    @GetMapping
    public ResponseDTO getAllClientes() {
        List<Cliente> clienteList;
        try{
            clienteList = clienteBl.getAllCliente();
            LOGGER.info("Clientes encontrados");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener los clientes");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(clienteList);
    }

    // Endpoint para obtener un cliente por su id
    @GetMapping("/{id}")
    public ResponseDTO getClienteById(@PathVariable Long id) {
        Cliente cliente;
        try{
            cliente = clienteBl.getClienteById(id);
            LOGGER.info("Cliente encontrado");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener el cliente");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(cliente);
    }

    // Endpoint para crear un cliente
    @PostMapping("/create")
    public ResponseDTO createCliente(@RequestBody Cliente cliente) {
        Cliente clienteCreado;
        try{
            clienteCreado = clienteBl.createCliente(cliente);
            LOGGER.info("Cliente creado");
        } catch (RuntimeException e){
            LOGGER.error("Error al crear el cliente", e);
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(clienteCreado);
    }

    @PostMapping("/login")
    public ResponseDTO login(@RequestBody LoginRequestDTO loginRequestDTO) {
        Cliente cliente;
        try {
            cliente = clienteBl.login(loginRequestDTO.getCorreo(), loginRequestDTO.getPassword());
            LOGGER.info("Se realizo la autencitacion");
        } catch (UserException e) {
            LOGGER.error("NO Se realizo la autencitacion", e);
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(cliente);
    }
}
