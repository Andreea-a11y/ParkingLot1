package com.parking.parkinglot.ejb;
import java.util.ArrayList;
import java.util.List;
import com.example.dto.UserDto;  // Importă DTO-ul UserDto
import com.parking.parkinglot.entities.User;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class UserBean {

    @PersistenceContext(unitName = "myPU")
    private EntityManager em;

    public List<UserDto> getUsers() {
        // Executăm interogarea pentru a obține lista de utilizatori
        List<User> users = em.createQuery("SELECT u FROM User u", User.class).getResultList();

        // Creăm lista de DTO-uri UserDto din entitățile User
        List<UserDto> userDtos = new ArrayList<>();
        for (User user : users) {
            userDtos.add(new UserDto(user.getUsername(), user.getEmail()));
        }
        return userDtos;
    }
}



