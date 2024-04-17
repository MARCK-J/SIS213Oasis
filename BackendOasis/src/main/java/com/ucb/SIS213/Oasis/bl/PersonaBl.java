package com.ucb.SIS213.Oasis.bl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ucb.SIS213.Oasis.dao.PersonaDao;
import com.ucb.SIS213.Oasis.entity.Persona;

import java.util.List;

@Service
public class PersonaBl {
    private PersonaDao personaDao;

    @Autowired
    public PersonaBl(PersonaDao personaDao) {
        this.personaDao = personaDao;
    }

    public List<Persona> getAllPersona() {
        return personaDao.findAll();
    }

    public Persona getPersonaById(Long id) {
        Persona persona = personaDao.findById(id).orElse(null);
        if (persona == null) {
            throw new RuntimeException("Persona does not exist");
        }
        return persona;
    }

    public Persona createPersona(Persona persona) {
        return personaDao.save(persona);
    }

    public Persona updatePersona(Persona persona) {
        Persona personaExistente = personaDao.findById(persona.getIdPersona()).orElse(null);
        if (personaExistente == null) {
            throw new RuntimeException("Persona does not exist");
        }
        return personaDao.save(persona);
    }

    public void  deletePersona(Long id) {

        if (personaDao.existsById(id)) {
            throw new RuntimeException("Persona does not exist");
        }
        personaDao.deleteById(id);
    }


}
