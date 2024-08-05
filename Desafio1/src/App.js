import React from 'react';
import CityWeatherCard from './components/CityWeatherCard';
import './styles/App.css';

const App = () => {
  const apiKey = 'fa7a09b0b185a14883206f2fa111f0a1';  // Reemplaza TU_API_KEY_AQUI con tu clave API real

  return (
    <div className="app-container">
      <div className="content">
        <h1>Weather Comparison</h1>
        <div className="cardsContainer">
          <CityWeatherCard apiKey={apiKey} />
          <CityWeatherCard apiKey={apiKey} />
          <CityWeatherCard apiKey={apiKey} />
        </div>
      </div>
    </div>
  );
};

const styles = {
  container: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    height: '100vh',
    backgroundColor: '#e0e0e0',
  },
  cardsContainer: {
    display: 'flex',
    justifyContent: 'center',
  },
};

export default App;
