package com.res.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class FacilityTest {

	private Facility facility;

    @BeforeEach
    public void setUp() {

        facility = new Facility("Swimming Pool", "Olympic-size pool with a view", "/images/pool.jpg");
    }

    @Test
    public void testDefaultConstructor() {
        Facility defaultFacility = new Facility();
        defaultFacility.setId(1);
        defaultFacility.setName("Gym");
        defaultFacility.setDescription("Fully equipped fitness center");
        defaultFacility.setFacilityImagePath("/images/gym.jpg");


        assertEquals(1, defaultFacility.getId());
        assertEquals("Gym", defaultFacility.getName());
        assertEquals("Fully equipped fitness center", defaultFacility.getDescription());
        assertEquals("/images/gym.jpg", defaultFacility.getFacilityImagePath());
    }

    @Test
    public void testParameterizedConstructor() {
        assertEquals("Swimming Pool", facility.getName());
        assertEquals("Olympic-size pool with a view", facility.getDescription());
        assertEquals("/images/pool.jpg", facility.getFacilityImagePath());
    }

    @Test
    public void testGettersAndSetters() {
        facility.setId(2);
        facility.setName("Spa");
        facility.setDescription("Relaxing spa with sauna");
        facility.setFacilityImagePath("/images/spa.jpg");

    
        assertEquals(2, facility.getId());
        assertEquals("Spa", facility.getName());
        assertEquals("Relaxing spa with sauna", facility.getDescription());
        assertEquals("/images/spa.jpg", facility.getFacilityImagePath());
    }

    @Test
    public void testToString() {
        
    }
}
