/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accenture.controller;

import com.accenture.model.Chicken;
import com.accenture.service.ChickenService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author david.andres.caamano
 */
@Controller
public class ChickenCrontroller {
    
    private ChickenService chickenService;
    
    @Autowired(required=true)
    @Qualifier(value="chickenService")
    public void setChickenService(ChickenService cs){
        this.chickenService=cs;
    }
    
    @RequestMapping(value = "/chicken", method = RequestMethod.GET)
    public String listChicken(Model model){
        model.addAttribute("chicken", new Chicken());
        model.addAttribute("listChicken", this.chickenService.listChicken());
        return "chicken";
    }
    
    //update and add
    @RequestMapping(value = "/chicken/add", method = RequestMethod.POST)
    public String addChicken(@ModelAttribute("chicken")Chicken c){
        if (c.getId()==0) {
            //new Chicken
            this.chickenService.addChicken(c);
        }else{
            //ya hay pollo
            this.chickenService.updateChicken(c);
        }
        return "redirect:/chicken";
    }
    
    @RequestMapping("/remove/{id}") //request mapping con una variable en la ruta que es pasada a la funcion de pleno
    public String removeChicken(@PathVariable("id") int id){
        this.chickenService.removeChicken(id);
        return "redirect:/chicken";
    }
    
    @RequestMapping("edit/{id}")
    public String editChicken(@PathVariable("id") int id, Model model){
        model.addAttribute("chicken",this.chickenService.getChickenById(id));
        model.addAttribute("listChicken", this.chickenService.listChicken());
    return "chicken";
    }
}
