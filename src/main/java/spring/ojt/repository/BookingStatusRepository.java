package spring.ojt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import spring.ojt.entity.BookingStatusEntity;

public interface BookingStatusRepository extends CrudRepository<BookingStatusEntity, Integer>{
	@Query("Select bs from BookingStatusEntity bs")
	public List<BookingStatusEntity> findAll(); 
}
