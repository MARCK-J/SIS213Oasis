import { defineStore } from 'pinia';
import { travelData, CountryData, Hotel, Car, Flight, CarouselItem } from '../data/data';

interface CountryState {
    selectedCountry: string | null;
    selectedCategory: 'hotel' | 'car' | 'flight' | null;
    hotels: Hotel[];
    cars: Car[];
    flights: Flight[];
    selectedHotel: Hotel | null;
    selectedCar: Car | null;
    selectedFlight: Flight | null;
    carCarousel: CarouselItem[];
    hotelCarousel: CarouselItem[];
    titulo: string;
    subtitulo: string;
}

export const useCountryStore = defineStore('country', {
    state: (): CountryState => ({
        selectedCountry: null,
        selectedCategory: null,
        hotels: [],
        cars: [],
        flights: [],
        selectedHotel: null,
        selectedCar: null,
        selectedFlight: null,
        hotelCarousel: [],
        carCarousel: [],
        titulo: '',
        subtitulo: ''
    }),
    actions: {
        setCountry(country: string) {
            this.selectedCountry = country;
            this.loadCountryData(country);
        },
        loadCountryData(country: string) {
            const countryData: CountryData | undefined = travelData[country];
            if (countryData) {
                this.hotels = countryData.hotels || [];
                this.cars = countryData.cityCars.flatMap(cityCars => cityCars.cars) || [];
                this.flights = countryData.flights || [];
                this.titulo = countryData.titulo || '';
                this.subtitulo = countryData.subtitulo || '';
                this.hotelCarousel = countryData.hotelCarousel || [];
                this.carCarousel = countryData.carCarousel || [];
                this.selectCategory(this.selectedCategory || 'hotel');
            } else {
                this.resetState();
            }
        },
        selectCategory(category: 'hotel' | 'car' | 'flight') {
            this.selectedCategory = category;
            const countryData = this.selectedCountry ? travelData[this.selectedCountry] : undefined;
            if (countryData) {
                switch (category) {
                    case 'hotel':
                        this.hotelCarousel = countryData.hotelCarousel || [];
                        break;
                    case 'car':
                        this.carCarousel = countryData.carCarousel || [];
                        break;
                    case 'flight':
                        this.carCarousel = countryData.flightCarousel || [];
                        break;
                    default:
                        this.carCarousel = [];
                }
            } else {
                this.carCarousel = [];
            }
        },
        selectHotel(hotel: Hotel) {
            this.selectedHotel = hotel;
            this.selectedCar = null;
            this.selectedFlight = null;
        },
        selectCar(car: Car) {
            this.selectedCar = car;
            this.selectedHotel = null;
            this.selectedFlight = null;
        },
        selectFlight(flight: Flight) {
            this.selectedFlight = flight;
            this.selectedHotel = null;
            this.selectedCar = null;
        },
        resetState() {
            this.hotels = [];
            this.cars = [];
            this.flights = [];
            this.hotelCarousel = [];
            this.carCarousel = [];
            this.titulo = '';
            this.subtitulo = '';
        }
    },
    getters: {
        selectedCountryData(state): CountryData | undefined {
            return state.selectedCountry ? travelData[state.selectedCountry] : undefined;
        }
    }
});
