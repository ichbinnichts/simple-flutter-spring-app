package br.nathan.api.DAO;

import br.nathan.api.DAO.connection.ConnectionFactory;
import br.nathan.api.models.Employee;
import br.nathan.api.port.EmployeeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EmployeeDAO implements EmployeeRepo {
    @Override
    public List<Employee> findAll() {
        final List<Employee> employeeList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        final String sql = "SELECT id, firstName, lastName "+
                " FROM employee; ";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();


            while(resultSet.next()){
                Employee employee = new Employee();
                employee.setId(resultSet.getInt("id"));
                employee.setFirstName(resultSet.getString("firstName"));
                employee.setLastName(resultSet.getString("lastName"));

                employeeList.add(employee);
            }
            resultSet.close();
            preparedStatement.close();

            return employeeList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Optional<Employee> findById(int id) {
        Employee employee = new Employee();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        final String sql = "SELECT id, firstName, lastName "+
                " from employee WHERE id = ?; ";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                employee.setId(resultSet.getInt("id"));
                employee.setFirstName(resultSet.getString("firstName"));
                employee.setLastName(resultSet.getString("lastName"));

                resultSet.close();
                preparedStatement.close();

                return Optional.of(employee);
            }else {
                return null;
            }
        }catch (SQLException e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean existsByFirstNameAndLastName(String firstName, String lastName) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        final String sql = "SELECT id, firstName, lastName FROM "+
                " employee WHERE firstName = ? AND lastName = ?;";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            resultSet = preparedStatement.executeQuery();

            return resultSet.next() ? true : false;

        }catch(SQLException e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean existsById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        final String sql = "SELECT id, firstName, lastName FROM "+
                " employee WHERE id = ?;";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            return resultSet.next() ? true : false;

        }catch(SQLException e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean save(Employee employee) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        final String sql = "INSERT INTO employee(id, firstName, lastName) "+
                " VALUES(default, ?, ?);";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, employee.getFirstName());
            preparedStatement.setString(2, employee.getLastName());
            preparedStatement.execute();

            preparedStatement.close();

            return true;

        }catch(SQLException e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean delete(Employee employee) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        final String sql = "DELETE FROM employee WHERE id = ? AND firstName = ? AND lastName = ?;";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, employee.getId());
            preparedStatement.setString(2, employee.getFirstName());
            preparedStatement.setString(3, employee.getLastName());

            preparedStatement.execute();
            preparedStatement.close();
            return true;

        }catch(SQLException e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean deleteById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        final String sql = "DELETE FROM employee WHERE id = ?;";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.execute();
            preparedStatement.close();
            return true;

        }catch(SQLException e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean update(int id, Employee employee) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        final String sql = "UPDATE employee SET firstName = ?, lastName = ? WHERE id = ?;";

        try{
            connection = ConnectionFactory.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, employee.getFirstName());
            preparedStatement.setString(2, employee.getLastName());
            preparedStatement.setInt(3, id);

            preparedStatement.execute();
            return true;


        }catch(SQLException e){
            throw new RuntimeException();
        }
    }
}
