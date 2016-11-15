/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accenture.service;

import com.accenture.model.Chicken;
import java.util.List;

/**
 *
 * @author david.andres.caamano
 */
public interface ChickenService {
    
    public void addChicken(Chicken c);
    public void updateChicken(Chicken c);
    public List<Chicken> listChicken();
    public Chicken getChickenById(int id);
    public void removeChicken(int id);
    
    
}
