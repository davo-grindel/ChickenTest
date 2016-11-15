/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accenture.DAO;

import java.util.List;

import com.accenture.model.Chicken;
/**
 *
 * @author david.andres.caamano
 */
public interface ChickenDAO {
    
    public void addChicken(Chicken c);
    public void updateChicken(Chicken c);
    public List<Chicken> listChicken();
    public Chicken getChickenById(int id);
    public void removeChicken(int id);
}
