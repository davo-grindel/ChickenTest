/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accenture.DAO;

import com.accenture.model.Chicken;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author david.andres.caamano
 */
public class ChickenDAOImpl implements ChickenDAO{

    private static final Logger logger = LoggerFactory.getLogger(ChickenDAOImpl.class);

    private SessionFactory sessionFactory;
	
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    
    @Override
    public void addChicken(Chicken c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
        logger.info("Chicken saved, chicken details="+c);
    }

    @Override
    public void updateChicken(Chicken c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
        logger.info("Chicken saved, chicken details="+c);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Chicken> listChicken() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Chicken> chickenList = session.createQuery("from Chicken").list();
        for(Chicken c : chickenList){
            logger.info("chicken List::"+c);
        }
        return chickenList;
    }

    @Override
    public Chicken getChickenById(int id) {
        Session session = this.sessionFactory.getCurrentSession();		
        Chicken c = (Chicken) session.load(Chicken.class, new Integer(id));
        logger.info("chicken loaded, chicken details="+c);
        return c;
    }

    @Override
    public void removeChicken(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Chicken c = (Chicken) session.load(Chicken.class, new Integer(id));
        if(null != c){
            session.delete(c);
        }
       logger.info("Chicken deleted successfully, details="+c);
    }
    
}
