import { Tab } from '@headlessui/react';
import axios from "axios";
import { useContext, useState } from "react";
import axiosClient from '../components/axios';
import { userStateContext } from '../contexts/ContextProvider';
import { Navigate } from 'react-router-dom';
import router from '../components/routes';

const Auth = (props) => {
    const { setCurrentUser, setUserToken } = userStateContext()
    const [username, setUsername] = useState();
    const [email, setEmail] = useState();
    const [password, setPassword] = useState()
    const [errors, setError] = useState([])
    //google auth 

    //login method
    const login = async (e) => {
        e.preventDefault();

        axiosClient.post("/login", {
            email: email,
            password: password
        }).then(({ data, status }) => {
            if (status === 200 && data.user.is_admin) {
                router.navigate('/admin')
                setCurrentUser(data.user)
                setUserToken(data.token)
            }else if(status === 200 && !data.user.is_admin){
                router.navigate('/')
                setCurrentUser(data.user)
                setUserToken(data.token)
            }

        }).catch((error) => {
            if (error.response.status === 422) {
                setError(error.response.data.errors)
                // const err = Object.values(error.response.data.errors).reduce((accum,next)=>[...accum,...next],[])
                // setError(err)
                // console.log(err);
            } else if (error.response.status === 200) {
                return router.navigate('/admin')
            }
        });


        // try {
        //     const response = await axios.post('http://localhost:8000/api/login', {
        //         email: email,
        //         password: password
        //     });

        //     console.log(response.data);
        // } catch (error) {
        //     console.error(error);
        // }
    }

    //registration method
    const handleSubmit = (e) => {
        e.preventDefault();

        axiosClient.post("/register", {
            name: username,
            email: email,
            password: password
        }).then(({ data }) => {
            setCurrentUser(data.user)
            setUserToken(data.token)
        }).catch((error) => {
            if (error.response) {
                const err = Object.values(error.response.data.errors).reduce((accum, next) => [...accum, ...next], [])
                setError(err)
                console.log(err);
            }
        });

        // try {
        //     const response = await axios.post('http://localhost:8000/api/register', {
        //         name: username,
        //         email: email,
        //         password: password
        //     });

        //     console.log(response.data);
        // } catch (error) {
        //     console.error(error);
        //     setError(error)
        // }
    };
    return (
        <div className="absolute t-0 bottom-0 justify-center w-full h-full bg-[#222222a6]/30 z-10 ">
            <div className="m-auto relative bg-white z-20 md:w-[40%] w-full h-full md:top-[20%] md:h-[70%] rounded-sm animate__animated animate__zoomIn">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1" stroke="currentColor" className="w-8 h-8 absolute top-[-6px] right-[-6px] bg-gray-200 rounded-full cursor-pointer" onClick={props.handleClick}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
                {/*
                <div className="flex justify-between">
                    <div className="flex justify-center flex-col">
                        <form action="" className="flex flex-col justify-center pl-10 p-24">
                            <h1>Log in</h1>
                            <label htmlFor="">Username</label>
                            <input type="text" name="username" onChange={(e)=>setUsername(e.target.value)}/>
                            <label htmlFor="">email</label>
                            <input type="password" name="email" onChange={(e)=>setPassword(e.target.value)}/>
                            <label htmlFor="">Password</label>
                            <input type="email" name="email" onChange={(e)=>setEmail(e.target.value)}/>
                            <input type="submit" className="bg-blue-500 p-3 cursor-pointer" onClick={handleSubmit}/>
                        </form>
                        <div>
                            <button className="flex bg-blue-500 p-3 items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                </svg>
                                <span className="ml-2">Continue with google</span>
                            </button>
                        </div>
                    </div>

                    <hr className="p-[1px] bg-gray-400 h-[400px]" />
                    <div className=" items-center p-20">
                        <button className="bg-blue-600 p-5 text-center">Create account</button>
                    </div> 
                </div>*/}


                <Tab.Group>
                    <Tab.List className='w-full grid grid-cols-2 pt-3'>
                        <Tab className='border-r-2 p-3 active:text-gray-500'>S'IDENTIFIER</Tab>
                        <Tab className=' p-3 active:text-gray-500'>S'INSCRIRE</Tab>
                    </Tab.List>
                    <Tab.Panels>
                        <Tab.Panel>
                            <div className='w-full h-full'>
                                <div className='p-8'>
                                    <form method='POST' className='flex flex-col justify-center' onSubmit={login}>
                                        <input type="email" name="email" onChange={(e) => setEmail(e.target.value)} placeholder='Email' className='p-3 border border-1' /> <br />
                                        {errors.email && (
                                            <div className="error">{errors.email[0]}</div>
                                        )}
                                        {errors && (
                                            <div className="alert alert-danger">
                                                <ul>
                                                    {Object.values(errors).map((error, index) => (
                                                        <li key={index}>{error[0]}</li>
                                                    ))}
                                                </ul>
                                            </div>
                                        )}
                                        <input type="password" name="password" onChange={(e) => setPassword(e.target.value)} placeholder='password' className='p-3 border border-1' /> <br />
                                        <input type="submit" value="S'IDENTIFIER" className="bg-blue-500 p-3 cursor-pointer" />
                                    </form>

                                </div>
                            </div>
                        </Tab.Panel>
                        <Tab.Panel>
                            <div className='w-full h-full'>
                                <div className='p-8'>
                                    <form method='POST' className='flex flex-col justify-center' onSubmit={handleSubmit} >

                                        <input type="text" name="username" onChange={(e) => setUsername(e.target.value)} placeholder='Username' className='p-3 border border-1' /> <br />

                                        <input type="email" name="email" onChange={(e) => setEmail(e.target.value)} placeholder='Email' className='p-3 border border-1' /> <br />
                                        <input type="password" name="password" onChange={(e) => setPassword(e.target.value)} placeholder='password' className='p-3 border border-1' /> <br />

                                        <input type="submit" value="S'INSCRIRE" className="bg-blue-500 p-3 cursor-pointer" />
                                    </form>
                                </div>
                            </div>
                        </Tab.Panel>
                    </Tab.Panels>
                </Tab.Group>

            </div>

        </div>
    );
}

export default Auth;