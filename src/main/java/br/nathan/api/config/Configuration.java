package br.nathan.api.config;

import br.nathan.api.DAO.EmployeeDAO;
import br.nathan.api.port.EmployeeRepo;
import br.nathan.api.services.EmployeeService;
import org.springframework.context.annotation.Bean;

@org.springframework.context.annotation.Configuration
public class Configuration {

    @Bean
    public EmployeeService employeeService(){
        EmployeeRepo employeeRepo = new EmployeeDAO();
        return new EmployeeService(employeeRepo);
    }
}
