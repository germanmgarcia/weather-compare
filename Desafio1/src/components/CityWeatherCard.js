import React, { useState } from 'react';
import { WiThermometer, WiHumidity, WiBarometer, WiStrongWind, WiDaySunny, WiCloud, WiRain, WiSnow, WiFog } from 'react-icons/wi';
import '../styles/WeatherBackground.css';

const CityWeatherCard = ({ apiKey }) => {
  const [city, setCity] = useState('');
  const [weatherData, setWeatherData] = useState(null);
  const [error, setError] = useState(null);

  const handleSearch = async () => {
    try {
      const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`);
      const data = await response.json();
      if (data.cod !== 200) {
        setError(data.message);
        setWeatherData(null);
      } else {
        setWeatherData(data);
        setError(null);
      }
    } catch (err) {
      setError('Error fetching weather data');
      setWeatherData(null);
    }
  };

  const getWeatherIcon = (main) => {
    switch (main) {
      case 'Clear':
        return <WiDaySunny size={64} />;
      case 'Clouds':
        return <WiCloud size={64} />;
      case 'Rain':
        return <WiRain size={64} />;
      case 'Snow':
        return <WiSnow size={64} />;
      case 'Fog':
        return <WiFog size={64} />;
      default:
        return <WiDaySunny size={64} />;
    }
  };

  return (
    <div className="weather-card">
      <div style={styles.cardContent}>
        <input
          type="text"
          value={city}
          onChange={(e) => setCity(e.target.value)}
          placeholder="Enter city"
          style={styles.input}
        />
        <button onClick={handleSearch} style={styles.button}>Search</button>
        {error && <p>{error}</p>}
        {weatherData && (
          <div style={styles.weatherInfo}>
            <h2>{weatherData.name}</h2>
            {getWeatherIcon(weatherData.weather[0].main)}
            <p><WiThermometer size={24} /> {weatherData.main.temp} °C</p>
            <p><WiHumidity size={24} /> {weatherData.main.humidity} %</p>
            <p><WiBarometer size={24} /> {weatherData.main.pressure} hPa</p>
            <p><WiStrongWind size={24} /> {weatherData.wind.speed} m/s</p>
          </div>
        )}
      </div>
    </div>
  );
};

const styles = {
  cardContent: {
    padding: '20px',
    borderRadius: '10px',
    textAlign: 'center',
    width: '300px',
  },
  input: {
    padding: '10px',
    borderRadius: '5px',
    border: 'none',
    marginBottom: '10px',
    width: '80%',
  },
  button: {
    padding: '10px 20px',
    borderRadius: '5px',
    border: 'none',
    backgroundColor: '#007BFF',
    color: 'white',
    cursor: 'pointer',
  },
  weatherInfo: {
    marginTop: '20px',
  },
};

export default CityWeatherCard;
