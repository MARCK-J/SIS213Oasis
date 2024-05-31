export interface Hotel {
    name: string;
    image: string;
    link: string;
    titulo: string;
    subtitulo: string;
    images: string[];  // Asumiendo que es un array de strings
    logoImage: string;
    title: string;
    model: string;
    pricePerDay: string;
    rating: number;
    brand: string;
    type: string;
    cities: string[];
    services: { name: string; icon: string }[];
    description: string;
    mapSrc: string;
}

export interface Car {
    name: string;
    image: string;
    link: string;
    brand: string;
    model: string;
    type: string;
    pricePerDay: string;
    availability: string;
    description: string;
    images: string[];
    companyLogo: string;
    location: string[];
}

export interface CityCars {
    city: string;
    cars: Car[];
}

export interface Flight {
    name: string;
    image: string;
    link: string;
}

export interface CarouselItem {
    src: string;
    alt: string;
    author: string;
    title: string;
    topic: string;
    des: string;
}

export interface CountryData {
    titulo: string;
    subtitulo: string;
    hotelCarousel: CarouselItem[];
    carCarousel: CarouselItem[];
    flightCarousel: CarouselItem[];
    hotels: Hotel[];
    cityCars: CityCars[];
    flights: Flight[];
}

export const travelData: Record<string, CountryData> = {
    Bolivia: {
        titulo: 'Los hoteles más populares para tus próximas vacaciones',
        subtitulo: 'Estos son algunos hoteles que han visitado otros viajeros:',
        hotelCarousel: [
            { src: 'https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg', alt: 'a', author: '1', title: 'hotel de bolivia', topic: 'hotel1', des: 'hotel para la ciudad' },
            { src: 'https://wallpaper.forfun.com/fetch/90/90091e333f2aa9ee8e35642c93cf6752.jpeg', alt: 'b', author: '2', title: 'esto es hotel bolivia ', topic: 'hotel2', des: 'Autos para camino peligrosos' },
            { src: 'https://arblatinamerica.com/wp-content/uploads/2021/07/Salar-de-Uyuni-1.jpg', alt: 'c', author: '3', title: 'DESING SLIDER bolivia', topic: 'hotel 3', des: 'Autos para acampar con tu familia' },
            { src: 'https://www.chevrolet.com.ec/content/dam/chevrolet/south-america/ecuador/espanol/index/index-subcontent/mh-scroller/abril-2024/mhs/2024-masthead-home-trailblazer-xl.jpg?imwidth=960', alt: 'bolivia', author: 'OASIS pais de bolivia', title: 'bolivia hotel', topic: 'Exclusivos', des: 'Lorem esta es una descripcion para hacer en slider' }
        ],
        carCarousel: [
            { src: 'https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg', alt: '1', author: '1', title: 'bolivia 1', topic: 'auto', des: 'auto bolivia' },
            { src: 'https://wallpaper.forfun.com/fetch/90/90091e333f2aa9ee8e35642c93cf6752.jpeg', alt: '2', author: '2', title: 'bolivia 2', topic: 'AUTOS', des: 'Autos para camino peligrosos' },
            { src: 'https://arblatinamerica.com/wp-content/uploads/2021/07/Salar-de-Uyuni-1.jpg', alt: '3', author: '3', title: 'bolivia 3', topic: 'AUTOS', des: 'Autos para acampar con tu familia' },
            { src: 'https://www.chevrolet.com.ec/content/dam/chevrolet/south-america/ecuador/espanol/index/index-subcontent/mh-scroller/abril-2024/mhs/2024-masthead-home-trailblazer-xl.jpg?imwidth=960', alt: 'Auto4', author: 'OASIS pais de bolivia', title: 'Autos para todo terreno', topic: 'Exclusivos', des: 'Lorem esta es una descripcion para hacer en slider' }
        ],
        flightCarousel: [
            { src: 'https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg', alt: 'Auto1', author: 'OASIS pais de bolivia 1', title: 'DESING SLIDER', topic: 'hotel1', des: 'hotel para la ciudad' },
            { src: 'https://wallpaper.forfun.com/fetch/90/90091e333f2aa9ee8e35642c93cf6752.jpeg', alt: 'Auto2', author: 'OASIS pais de bolivia 2', title: 'DESING SLIDER', topic: 'AUTOS', des: 'Autos para camino peligrosos' },
            { src: 'https://arblatinamerica.com/wp-content/uploads/2021/07/Salar-de-Uyuni-1.jpg', alt: 'Auto3', author: 'OASIS pais de bolivia 3', title: 'DESING SLIDER', topic: 'AUTOS', des: 'Autos para acampar con tu familia' },
            { src: 'https://www.chevrolet.com.ec/content/dam/chevrolet/south-america/ecuador/espanol/index/index-subcontent/mh-scroller/abril-2024/mhs/2024-masthead-home-trailblazer-xl.jpg?imwidth=960', alt: 'Auto4', author: 'OASIS pais de bolivia', title: 'Autos para todo terreno', topic: 'Exclusivos', des: 'Lorem esta es una descripcion para hacer en slider' }
        ],
        hotels: [
            {
                name: 'Hotel 1',
                image: 'https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg',
                /*Datos donde tien que ir el hotel seleccionado*/

                images: [ 'https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg'],
                logoImage: '',
                title: 'Hotel 1',
                model: 'Hotel premiun',
                pricePerDay: '$100',
                rating: 1,
                brand: 'no se que poner aqui',
                type: 'para parejas xd',
                cities: [ 'la paz'],
                services: [
                    { name: 'Wi-Fi', icon: '' },
                    { name: 'Piscina', icon: '' }
                ],
                description: 'Descripción detallada del hotel.dsgdsgdskdgjvisdhgksahgjehjghskdjjshgjjskjskhguihewuhgridhgjehjwghuwgqf',
                mapSrc: 'https://www.google.com/maps/embed?...'
            },
            {
                name: 'prueba 2',
                image: 'imagen_del_hotel.jpg',
                link: 'link_del_hotel',
                titulo: 'Titulo del Hotel',
                subtitulo: 'Subtitulo del Hotel',
                images: ['imagen1.jpg', 'imagen2.jpg'],
                logoImage: 'logo_del_hotel.jpg',
                title: 'Hotel Rio de Janeiro',
                model: 'Modelo del Hotel',
                pricePerDay: '$100',
                rating: 2,
                brand: 'Marca del Hotel',
                type: 'Tipo del Hotel',
                cities: ['Ciudad1', 'Ciudad2'],
                services: [
                    { name: 'Wi-Fi', icon: 'wifi-icon' },
                    { name: 'Piscina', icon: 'pool-icon' }
                ],
                description: 'Descripción detallada del hotel.',
                mapSrc: 'https://www.google.com/maps/embed?...'
            },
            // Añadir más hoteles aquí...
        ],
        cityCars: [
            {
                city: 'sadvsksdkvj',
                cars: [
                    {
                        name: 'esto tendria que funcinar',
                        image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/kicks/NewKicksBolivia/Nuevo-Kicks-(packshot)-Exclusive.jpg.ximg.l_3_m.smart.jpg',
                        link: '/Auto_ordenar',
                        brand: 'Nissan',
                        model: 'Kicks',
                        type: 'bagoneta',
                        pricePerDay: '100 bs',
                        availability: '',
                        description: 'Kicks es un vehículo de alta gama disponible para alquiler en todo el país. Ofrece un rendimiento excepcional, comodidad y las últimas tecnologías para una experiencia de conducción inigualable.',
                        images: [
                            'https://focus.belfasttelegraph.co.uk/thumbor/Nyyf7H_RQKHly7Sq1kSPURnDzPw=/960x640/smart/prod-mh-ireland/d1d08534-9b73-11ed-b69a-0210609a3fe2',
                            'https://www.quadisllansa.es/wp-content/uploads/sites/61/2021/03/Nissan_Qashqai_Premiere_Edition_07.jpg'
                        ],
                        companyLogo: 'https://i.pinimg.com/736x/f8/d1/7b/f8d17baba349db2c958bd2d075a8d32e.jpg',
                        location: ['https://www.google.com/maps/place/Universidad+Católica+Boliviana+%22San+Pablo%22/@-16.522052,-68.1131281,17.72z/data=!4m9!1m2!2m1!1s-16.500000,-68.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-16.5226502!4d-68.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    },
                    {
                        name: 'Segundo Auto',
                        image: 'https://www.nissan-cdn.net/content/dam/Nissan/BO/vehicles/kicks/NewKicksBolivia/Nuevo-Kicks-(packshot)-Exclusive.jpg.ximg.l_3_m.smart.jpg',
                        link: '/segundo_auto',
                        brand: 'Toyota',
                        model: 'Corolla',
                        type: 'sedan',
                        pricePerDay: '120 bs',
                        availability: '',
                        description: 'El Toyota Corolla es un automóvil familiar confiable y cómodo. Perfecto para viajes largos o para explorar la ciudad.',
                        images: [
                            'https://example.com/imagen1.jpg',
                            'https://example.com/imagen2.jpg'
                        ],
                        companyLogo: 'https://example.com/logo.jpg',
                        location: ['https://www.google.com/maps/place/Toyota/@-17.522052,-67.1131281,17.72z/data=!4m9!1m2!2m1!1s-17.500000,-67.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-17.5226502!4d-67.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    },
                    {
                        name: 'tercerautoAuto',
                        image: 'https://example.com/segundo_auto.jpg',
                        link: '/segundo_auto',
                        brand: 'Toyota',
                        model: 'Corolla',
                        type: 'sedan',
                        pricePerDay: '120 bs',
                        availability: '',
                        description: 'El Toyota Corolla es un automóvil familiar confiable y cómodo. Perfecto para viajes largos o para explorar la ciudad.',
                        images: [
                            'https://example.com/imagen1.jpg',
                            'https://example.com/imagen2.jpg'
                        ],
                        companyLogo: 'https://example.com/logo.jpg',
                        location: ['https://www.google.com/maps/place/Toyota/@-17.522052,-67.1131281,17.72z/data=!4m9!1m2!2m1!1s-17.500000,-67.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-17.5226502!4d-67.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    },
                    {
                        name: 'cuarto auto',
                        image: 'https://example.com/segundo_auto.jpg',
                        link: '/segundo_auto',
                        brand: 'Toyota',
                        model: 'Corolla',
                        type: 'sedan',
                        pricePerDay: '120 bs',
                        availability: '',
                        description: 'El Toyota Corolla es un automóvil familiar confiable y cómodo. Perfecto para viajes largos o para explorar la ciudad.',
                        images: [
                            'https://example.com/imagen1.jpg',
                            'https://example.com/imagen2.jpg'
                        ],
                        companyLogo: 'https://example.com/logo.jpg',
                        location: ['https://www.google.com/maps/place/Toyota/@-17.522052,-67.1131281,17.72z/data=!4m9!1m2!2m1!1s-17.500000,-67.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-17.5226502!4d-67.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    },
                    {
                        name: '5ato',
                        image: 'https://example.com/segundo_auto.jpg',
                        link: '/segundo_auto',
                        brand: 'Toyota',
                        model: 'Corolla',
                        type: 'sedan',
                        pricePerDay: '120 bs',
                        availability: '',
                        description: 'El Toyota Corolla es un automóvil familiar confiable y cómodo. Perfecto para viajes largos o para explorar la ciudad.',
                        images: [
                            'https://example.com/imagen1.jpg',
                            'https://example.com/imagen2.jpg'
                        ],
                        companyLogo: 'https://example.com/logo.jpg',
                        location: ['https://www.google.com/maps/place/Toyota/@-17.522052,-67.1131281,17.72z/data=!4m9!1m2!2m1!1s-17.500000,-67.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-17.5226502!4d-67.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    }
                    // Añadir más autos aquí...
                ]
            },
            {
                city: 'Santa Cruz',
                cars: [
                    {
                        name: 'Toyota Hilux',
                        image: 'https://example.com/toyota_hilux.jpg',
                        link: '/toyota_hilux',
                        brand: 'Toyota',
                        model: 'Hilux',
                        type: 'pickup',
                        pricePerDay: '150 bs',
                        availability: '',
                        description: 'La Toyota Hilux es perfecta para terrenos difíciles y trabajos pesados. Robusta y confiable en cualquier condición.',
                        images: [
                            'https://example.com/toyota_hilux_1.jpg',
                            'https://example.com/toyota_hilux_2.jpg'
                        ],
                        companyLogo: 'https://example.com/logo.jpg',
                        location: ['https://www.google.com/maps/place/Toyota/@-17.522052,-67.1131281,17.72z/data=!4m9!1m2!2m1!1s-17.500000,-67.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-17.5226502!4d-67.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    }
                    // Añadir más autos aquí...
                ]
            },
            {
                city: 'Cochabamba',
                cars: [
                    {
                        name: 'Ford Escape',
                        image: 'https://example.com/ford_escape.jpg',
                        link: '/ford_escape',
                        brand: 'Ford',
                        model: 'Escape',
                        type: 'SUV',
                        pricePerDay: '130 bs',
                        availability: '',
                        description: 'El Ford Escape combina estilo y funcionalidad, ideal para aventuras en carretera y uso diario.',
                        images: [
                            'https://example.com/ford_escape_1.jpg',
                            'https://example.com/ford_escape_2.jpg'
                        ],
                        companyLogo: 'https://example.com/logo.jpg',
                        location: ['https://www.google.com/maps/place/Ford/@-17.522052,-67.1131281,17.72z/data=!4m9!1m2!2m1!1s-17.500000,-67.150000\'!3m5!1s0x915f20ee187a3103:0x2f2bb2b7df32a24d!8m2!3d-17.5226502!4d-67.1119912!16s%2Fm%2F0cpdsfq?entry=ttu']
                    }
                    // Añadir más autos aquí...
                ]
            }
        ],
        flights: [
            {
                name: 'flights a bolivia',
                image: 'https://i.pinimg.com/originals/c9/b5/6e/c9b56e1c8c4a7199cd83b27e34be219f.jpg',
                link: 'link_to_flight'
            }
        ]
    }

};
