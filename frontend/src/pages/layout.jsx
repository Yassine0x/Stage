import { useState } from "react";
import { Menu } from '@headlessui/react'
import { NavLink, Outlet } from "react-router-dom";
import Auth from "./authentification";
import { userStateContext } from "../contexts/ContextProvider";

//import 'animate.css';
const DefaultLayout = () => {
    const {userToken,currentUser}=userStateContext()
    const [Show, setShow] = useState(false);

    const handleClick = () => {
        setShow(!Show)
    }
    /*const [search, setSearch] = useState(false);
    const searchHandle = () => {
        setSearch(!search)
    }*/
    return (
        <div className="font-serif overflow-hidden sticky">
            <nav className="block justify-around items-center text-center m-0 py-5 z-1 ">
                <h1 className="text-center text-[#373a3b] font-bold text-2xl md:mb-5 sticky animate-pulse">MyShop</h1>
                <div className="md:flex hidden  justify-around bg-[#f5f5f7] p-3 m-0 w-full">
                    <div className=" items-center hidden md:inline-flex ">
                        <ul className="flex">
                            <li className="ml-[30px] p-[5px] text-[#585e63] text-[16px] text-center"><NavLink to={'/'}>Acceuil</NavLink></li>
                            <li className="ml-[30px] p-[5px] text-[#585e63] text-[16px] text-center"><NavLink to={'/shop'}>Produits</NavLink></li>
                            <li className="ml-[30px] p-[5px] text-[#585e63] text-[16px] text-center"><NavLink to={'/about'}>Promotions</NavLink></li>
                            <li className="ml-[30px] p-[5px] text-[#585e63] text-[16px] text-center"><NavLink to={'/about'}>About</NavLink></li>
                            <li className="ml-[30px] p-[5px] text-[#585e63] text-[16px] text-center"><NavLink to={'/about'}>Contact</NavLink></li>


                        </ul>
                    </div>
                    <div className="xl:flex items-center p-0 m-0 border-2 border-blue-600 hidden border-r-0 rounded-md">
                        <div className="flex w-[500px]">
                            <div className="w-full">
                                <input type="text" placeholder="Search.." className="w-full text-[14px] p-[8px] pl-5 bg-transparent focus:border-transparent focus:outline-none" />
                            </div>
                            {/* <div className="">
                                <select name="" id="" className="text-[#585e63] bg-transparent text-[14px] focus:border-none p-[10px] mr-1 focus:border-transparent focus:outline-none">
                                    <option defaultValue>All categories</option>
                                    <option value="">test</option>
                                </select>
                            </div> */}
                        </div>


                        <div className="flex bg-blue-600 text-white p-[10px] rounded-r-md relative right-0 items-center cursor-pointer hover:bg-blue-900">
                            <span className="pl-2">Search</span>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1" stroke="currentColor" className="w-6 h-6 ml-2 " >
                                <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                            </svg>
                        </div>
                    </div>
                    <div className='items-center inline-flex'>
                        <div className="flex">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-6 h-6 cursor-pointer">
                                <path strokeLinecap="round" strokeLinejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                            </svg>

                            <div className="text-center ml-2">
                                <span className="items-center ">0</span>
                            </div>
                        </div>

                        <div className="items-center cursor-pointer ml-5" onClick={handleClick}>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-6 h-6">
                                <path strokeLinecap="round" strokeLinejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                            </svg>
                            <span>{userToken ? currentUser.name:'login'}</span>
                        </div>
                        <div>

                        </div>
                    </div>
                </div>
                <div className="md:hidden block">
                    <Menu>
                        <Menu.Button className='absolute right-5 top-5'><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" className="w-8 h-8">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                        </svg>
                        </Menu.Button>
                        <Menu.Items className='flex flex-col z-20 w-full h-full m-0 mt-5 text-justify bg-gray-900'>
                            <Menu.Item className='mt-3 ml-0 w-full p-1 pl-5 text-white text-[20px]'>
                                <NavLink to={'/home'}>Acceuil</NavLink>
                            </Menu.Item>
                            <Menu.Item className='mt-3 m-0 w-full p-1 pl-5 text-white text-[20px]'>
                                <NavLink to={'/shop'}>Produit</NavLink>
                            </Menu.Item>
                            <Menu.Item className='mt-3 m-0 w-full p-1 pl-5 text-white text-[20px]'>
                                <NavLink to={'/about'}>Promotions</NavLink>
                            </Menu.Item>
                            <Menu.Item className='mt-3 m-0 w-full p-1 pl-5 text-white text-[20px]'>
                                <NavLink to={'/about'}>About</NavLink>
                            </Menu.Item>
                            <Menu.Item className='mt-3 m-0 w-full p-1 pl-5 text-white text-[20px]'>
                                <NavLink to={'/about'}>Contact</NavLink>
                            </Menu.Item>
                            <Menu.Item className='mt-5 mb-5 m-auto w-[250px] p-1 pl-5 text-white text-[20px]'>
                                <button onClick={handleClick} className='bg-blue-500 p-2'>Login</button>
                            </Menu.Item>
                        </Menu.Items>
                    </Menu>
                </div>
            </nav>
            {Show && !currentUser.name && <Auth handleClick={handleClick}/>}

            <Outlet />
            <div className='flex justify-center bg-[#171f25] text-center p-[40px] text-white'>
                <p>
                    Copyright &copy; Your Website 2023
                </p>
            </div>
        </div>
    );
}

export default DefaultLayout;