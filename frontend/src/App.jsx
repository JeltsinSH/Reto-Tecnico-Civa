import { useState, useEffect } from "react";
import civa from './assets/civa.webp';
import './App.css';


const BusTable = () => {
  const [buses, setBuses] = useState([]); 
  const [searchId, setSearchId] = useState(""); 
  const [filteredBuses, setFilteredBuses] = useState([]); 
  const [currentPage, setCurrentPage] = useState(1); 
  const busesPerPage = 10; 

  const fetchBuses = () => {
    fetch("http://localhost:8080/bus")
      .then((res) => res.json())
      .then((data) => {
        setBuses(data);
        setFilteredBuses(data); 
      })
      .catch((err) => console.error("Error al obtener los buses:", err));
  };

  useEffect(() => {
    fetchBuses();
  }, []);

  const handleSearch = () => {
    if (searchId) {
      fetch(`http://localhost:8080/bus/${searchId}`) // buscar por ID
        .then((res) => res.json())
        .then((data) => {
          setFilteredBuses(data ? [data] : []); 
          setCurrentPage(1); 
        })
        .catch((err) => console.error("Error al buscar el bus por ID:", err));
    } else {
      fetchBuses(); 
      setCurrentPage(1); 
    }
  };

  const showAllBuses = () => {
    fetchBuses(); 
    setSearchId(""); 
    setCurrentPage(1); 
  };

  const indexOfLastBus = currentPage * busesPerPage;
  const indexOfFirstBus = indexOfLastBus - busesPerPage;
  const currentBuses = filteredBuses.slice(indexOfFirstBus, indexOfLastBus);

  const pageNumbers = [];
  for (let i = 1; i <= Math.ceil(filteredBuses.length / busesPerPage); i++) {
    pageNumbers.push(i);
  }

  const paginate = (pageNumber) => setCurrentPage(pageNumber);
  const nextPage = () => setCurrentPage((prevPage) => Math.min(prevPage + 1, pageNumbers.length));
  const prevPage = () => setCurrentPage((prevPage) => Math.max(prevPage - 1, 1));

  return (
    <div>

      {}
      <div>
        <input
          type="number"
          placeholder="Buscar bus por ID"
          value={searchId}
          onChange={(e) => setSearchId(e.target.value)}
        />
        <button onClick={handleSearch}>Buscar</button>
        {}
        <button onClick={showAllBuses}>Mostrar Todos</button>
      </div>

      {}
      <table border="1" cellPadding="8" cellSpacing="0">
        <thead>
          <tr>
            <th>ID</th>
            <th>Número de Bus</th>
            <th>Placa</th>
            <th>Fecha de Creación</th>
            <th>Características</th>
            <th>Activo</th>
            <th>Marca</th>
          </tr>
        </thead>
        <tbody>
          {currentBuses.length === 0 ? (
            <tr>
              <td colSpan="7">No se encontraron buses.</td>
            </tr>
          ) : (
            currentBuses.map((bus) => (
              <tr key={bus.id}>
                <td>{bus.id}</td>
                <td>{bus.numeroBus}</td>
                <td>{bus.placa}</td>
                <td>{bus.fechaCreacion}</td>
                <td>{bus.caracteristicas}</td>
                <td>{bus.activo ? "Sí" : "No"}</td>
                <td>{bus.marca?.nombre || "Sin Marca"}</td>
              </tr>
            ))
          )}
        </tbody>
      </table>

      {}
      <div>
        <button onClick={prevPage} disabled={currentPage === 1}>
          Anterior
        </button>
        {pageNumbers.map((number) => (
          <button
            key={number}
            onClick={() => paginate(number)}
            disabled={number === currentPage}
          >
            {number}
          </button>
        ))}
        <button onClick={nextPage} disabled={currentPage === pageNumbers.length}>
          Siguiente
        </button>
      </div>
    </div>
  );
};

function App() {
  return (
    <>
      <div>
        <img src={civa} alt="Civa" className="logo" />
      </div>
      <h1>Reto Técnico Practicante Desarrollador FullStack</h1>
      {}
      <BusTable />
    </>
  );
}

export default App;
