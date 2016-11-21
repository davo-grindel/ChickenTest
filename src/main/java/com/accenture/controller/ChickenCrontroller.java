/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accenture.controller;

import com.accenture.model.Chicken;
import com.accenture.service.ChickenService;
import com.google.gson.Gson;
import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    
    //public @ResponseBody void removeChicken(@RequestParam(value="id", defaultValue=1) int id){
    @RequestMapping("/remove") 
    public @ResponseBody void removeChicken(@RequestParam(value="id") int id){
        this.chickenService.removeChicken(id);
    }
    
//    @RequestMapping(value="edit/{id}", method = RequestMethod.GET)
//    public String editChicken(@PathVariable("id") int id, Model model){
//        model.addAttribute("chicken",this.chickenService.getChickenById(id));
//        model.addAttribute("listChicken", this.chickenService.listChicken());
//    return "chicken";
//    }
    
    @RequestMapping(value = "/rest/chicken", method = RequestMethod.GET)
    @ResponseBody
    public String restListChicken(){
        String json = new Gson().toJson(this.chickenService.listChicken());         
        return json;
    }

    @RequestMapping("/edit")
    public @ResponseBody void editChicken(@RequestParam(value="id") int id,@RequestParam(value="name") String name,@RequestParam(value="num_eggs") int num_eggs){
            Chicken c = this.chickenService.getChickenById(id);
            c.setName(name);
            c.setNum_egg(num_eggs);
            this.chickenService.updateChicken(c);
    }
    
}
