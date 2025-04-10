import { useState, useEffect } from "react";

const BusTable = () => {
  const [buses, setBuses] = useState([]);

  useEffect(() => {
    fetch("http://localhost:8080/bus") // Asegúrate de que este endpoint esté corriendo
      .then((res) => res.json())
      .then((data) => setBuses(data))
      .catch((err) => console.error("Error al obtener los buses:", err));
  }, []);

  return (
    <div>
      <h2>Lista de Buses</h2>
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
          {buses.map((bus) => (
            <tr key={bus.id}>
              <td>{bus.id}</td>
              <td>{bus.numeroBus}</td>
              <td>{bus.placa}</td>
              <td>{bus.fechaCreacion}</td>
              <td>{bus.caracteristicas}</td>
              <td>{bus.activo ? "Sí" : "No"}</td>
              <td>{bus.marca?.nombre || "Sin Marca"}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default BusTable;