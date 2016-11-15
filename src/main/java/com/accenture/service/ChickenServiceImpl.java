/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accenture.service;

import com.accenture.DAO.ChickenDAO;
import com.accenture.model.Chicken;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author david.andres.caamano
 */
public class ChickenServiceImpl implements ChickenService{

    private ChickenDAO ChickenDAO;
    
    public void setChickenDAO(ChickenDAO chickenDAO) {
        this.ChickenDAO = chickenDAO;
    }
    
    @Override
    @Transactional
    public void addChicken(Chicken c) {
        this.ChickenDAO.addChicken(c);
    }

    @Override
    @Transactional
    public void updateChicken(Chicken c) {
        this.ChickenDAO.updateChicken(c);
    }

    @Override
    @Transactional
    public List<Chicken> listChicken() {
        return this.ChickenDAO.listChicken();
    }

    @Override
    @Transactional
    public Chicken getChickenById(int id) {
        return this.ChickenDAO.getChickenById(id);
    }

    @Override
    @Transactional
    public void removeChicken(int id) {
        this.ChickenDAO.removeChicken(id);
    }
    
}
