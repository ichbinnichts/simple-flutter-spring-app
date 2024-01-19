package br.nathan.api.port;

import br.nathan.api.models.Employee;

import java.util.List;
import java.util.Optional;

public interface EmployeeRepo {
    List<Employee> findAll();

    Optional<Employee> findById(int id);

    boolean existsByFirstNameAndLastName(String firstName, String lastName);

    boolean existsById(int id);

    boolean save(Employee employee);

    boolean delete(Employee employee);

    boolean deleteById(int id);

    boolean update(int id, Employee employee);
}
