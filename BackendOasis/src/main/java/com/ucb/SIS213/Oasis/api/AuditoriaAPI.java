package com.ucb.SIS213.Oasis.api;

import java.time.LocalDateTime;
import java.util.List;

import com.ucb.SIS213.Oasis.dto.AuditoriaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import com.ucb.SIS213.Oasis.bl.AuditoriaBl;
import com.ucb.SIS213.Oasis.dto.ResponseDTO;
import com.ucb.SIS213.Oasis.entity.Auditoria;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/api/v1/auditoria")
public class AuditoriaAPI {

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(AuditoriaAPI.class);

    AuditoriaBl auditoriaBl;
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public AuditoriaAPI(AuditoriaBl auditoriaBl, JdbcTemplate jdbcTemplate) {
        this.auditoriaBl = auditoriaBl;
        this.jdbcTemplate = jdbcTemplate;
    }

    // Endpoint para obtener todos los auditorias
    @GetMapping
    public ResponseDTO getAllAuditorias() {
        List<Auditoria> auditoriaList;
        try{
            auditoriaList = auditoriaBl.getAllAuditoria();
            LOGGER.info("Auditorias encontrados");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener los auditorias");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(auditoriaList);
    }

    // Endpoint para obtener un auditoria por su id
    @GetMapping("/{id}")
    public ResponseDTO getAuditoriaById(@PathVariable Long id) {
        Auditoria auditoria;
        try{
            auditoria = auditoriaBl.getAuditoriaById(id);
            LOGGER.info("Auditoria encontrado");
        } catch (RuntimeException e){
            LOGGER.error("Error al obtener el auditoria");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(auditoria);
    }

    // Endpoint para crear un auditoria
    @PostMapping("/create")
    public ResponseDTO createAuditoria(@RequestBody Auditoria auditoria) {
        Auditoria auditoriaCreado;
        try{
            
            auditoriaCreado = auditoriaBl.createAuditoria(auditoria);
            LOGGER.info("Auditoria creado");
        } catch (RuntimeException e){
            LOGGER.error("Error al crear el auditoria");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(auditoriaCreado);
    }

    // Endpoint para actualizar un auditoria
    @PutMapping("/update")
    public ResponseDTO updateAuditoria(@RequestBody Auditoria auditoria) {
        Auditoria auditoriaActualizado;
        try {
            LOGGER.info("Auditoria: " + auditoria.getIdAudit().toString());
            auditoriaActualizado = auditoriaBl.updateAuditoria(auditoria);
            LOGGER.info("Auditoria actualizado");
        } catch (RuntimeException e) {
            LOGGER.error("Error al actualizar el auditoria");
            return new ResponseDTO("TASK-1000", e.getMessage());
        }
        return new ResponseDTO(auditoriaActualizado);
    }

    @GetMapping("/auditorias")
    public List<AuditoriaDTO> obtenerVuelos() {
        String sql = "select au.*, pe.nombre, pe.apellidop\n" +
                "from auditoria au, cliente cl, persona pe, admin ad\n" +
                "where (au.cliente_idcliente = cl.idcliente\n" +
                "and cl.persona_idpersona = pe.idpersona) \n" +
                "or (au.admin_idadmin = ad.idAdmin and ad.persona_idPersona = pe.idPersona)";

        List<AuditoriaDTO> auditorias = jdbcTemplate.query(sql, (rs, rowNum) -> {
            AuditoriaDTO auditoria = new AuditoriaDTO();
            auditoria.setIdAudit(rs.getLong("idAudit"));
            auditoria.setFecha(rs.getDate("fecha"));
            auditoria.setHora(rs.getTime("hora"));
            auditoria.setFechaInicio(LocalDateTime.parse(rs.getString("fechainicio")));
            auditoria.setFechaFin(LocalDateTime.parse(rs.getString("fechafin")));
            auditoria.setIp(rs.getString("ip"));
            auditoria.setIdAdmin(rs.getLong("admin_idadmin"));
            auditoria.setIdCliente(rs.getLong("cliente_idcliente"));

            auditoria.setCorreo(rs.getString("correo"));
            auditoria.setNombre(rs.getString("nombre"));
            auditoria.setApellidoP(rs.getString("apellidop"));
            return auditoria;
        });

        return auditorias;
    }
}
