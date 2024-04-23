package com.ucb.SIS213.Oasis.bl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ucb.SIS213.Oasis.dao.ClienteDao;
import com.ucb.SIS213.Oasis.entity.Cliente;

import java.util.List;

@Service
public class ClienteBl {


    private ClienteDao clienteDao;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public ClienteBl(ClienteDao clienteDao, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.clienteDao = clienteDao;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public List<Cliente> getAllCliente() {
        return clienteDao.findAll();
    }

    public Cliente getClienteById(Long id) {
        Cliente cliente = clienteDao.findById(id).orElse(null);
        if (cliente == null) {
            throw new RuntimeException("Cliente does not exist");
        }
        return cliente;
    }

    public Cliente createCliente(Cliente cliente) {
        String password = cliente.getPassword();
        String hashedPassword = bCryptPasswordEncoder.encode(password);
        cliente.setPassword(hashedPassword);
        System.out.println("Contraseña: " + cliente.getPassword());
        return clienteDao.save(cliente);
    }

    public Cliente updateCliente(Cliente cliente) {
        Cliente clienteExistente = clienteDao.findById(cliente.getIdCliente()).orElse(null);
        if (clienteExistente == null) {
            throw new RuntimeException("Cliente does not exist");
        }
        return clienteDao.save(cliente);
    }

    public void  deleteCliente(Long id) {

        if (clienteDao.existsById(id)) {
            throw new RuntimeException("Cliente does not exist");
        }
        clienteDao.deleteById(id);
    }
}
