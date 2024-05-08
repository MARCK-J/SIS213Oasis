package com.ucb.SIS213.Oasis.bl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ucb.SIS213.Oasis.dao.AdminDao;
import com.ucb.SIS213.Oasis.entity.Admin;

import java.util.List;

@Service
public class AdminBl {

    private AdminDao adminDao;

    @Autowired
    public AdminBl(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    public List<Admin> getAllAdmin() {
        return adminDao.findAll();
    }

    public Admin getAdminById(Long id) {
        Admin admin = adminDao.findById(id).orElse(null);
        if (admin == null) {
            throw new RuntimeException("Admin does not exist");
        }
        return admin;
    }

    public Admin createAdmin(Admin admin) {

        return adminDao.save(admin);
    }

    public Admin createNewAdmin(Admin admin) {
        return adminDao.save(admin);
    }

    public Admin updateAdmin(Admin admin) {
        Admin adminExistente = adminDao.findById(admin.getIdAdmin()).orElse(null);
        if (adminExistente == null) {
            throw new RuntimeException("Admin does not exist");
        }
        return adminDao.save(admin);
    }

    public void deleteAdmin(Long id) {

        if (adminDao.existsById(id)) {
            throw new RuntimeException("Admin does not exist");
        }
        adminDao.deleteById(id);
    }

}
