import axios from "axios";


const axiosClient = axios.create({
    baseURL: `${import.meta.env.VITE_API_BASE_URL}/api`
})

axiosClient.interceptors.request.use((config)=>{
    config.headers.Authorization = `Bearer ${localStorage.getItem('TOKEN')}`
    return config
})

axiosClient.interceptors.response.use(response =>{
    return response;
},error =>{
    if (error.response && error.response.status === 401){
        // router.navigate('/login')
        return error
        console.log(error)
    }
    
})

export default axiosClient;