import { useEffect, useState } from "react";
import axiosClient from "../../components/axios";
import { Menu } from "@headlessui/react";

const Users = () => {
    const [show, setShow] = useState(false);
    const [users, setUsers] = useState([]); 
    useEffect(()=>{
        axiosClient.get('/showProduct').then(
            response=>{
                setUsers(response.data)
                console.log(products)
            }
        ).catch((error)=>{
            console.log(error);
        })}
    ,[])

    return ( 
        <div>
            <div className="relative w-[100%] h-[100vh] bg-slate-200">
                <div className="flex justify-between p-7">
                    <div>
                        <h1>Utilisateurs</h1>
                    </div>
                    <div className="ml-5">
                        <button className="px-5 py-2 bg-orange-500 rounded-md" onClick={() => setShow(!show)}>Ajouter un Utilisateur</button>
                    </div>
                </div>

                {show && <AjouterProduit show={show} setShow={setShow} />
                }

                <div className="bg-white px-10 py-5 rounded-md m-5">
                    <div>
                        <table width="100%">
                            <thead className=" bg-slate-200 p-20 shadow-sm rounded-md">
                                <th>ID</th>
                                <th>Image</th>
                                <th>Titre</th>
                                <th>Prix</th>
                                <th>Derniere mise a jour</th>
                                <th>Actions</th>
                            </thead>
                            <tbody>
                                {users && users.map((user, index) => (
                                    <tr key={index} className="p-5">
                                        <td className="text-center items-center">{user.id}</td>
                                        <td className="text-center items-center"><img src={`http://localhost:8000/${user.image}`} alt="" /></td>
                                        <td className="text-center items-center">{user.title}</td>
                                        <td className="text-center items-center">{user.price}</td>
                                        <td className="text-center items-center">{user.updated_at}</td>
                                        <td className="text-center items-center">
                                            <Menu >
                                                <Menu.Button>
                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="blue" className="w-6 h-6">
                                                        <path strokeLinecap="round" strokeLinejoin="round" d="M12 6.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 12.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 18.75a.75.75 0 110-1.5.75.75 0 010 1.5z" />
                                                    </svg>


                                                </Menu.Button>
                                                <Menu.Items className="absolute right-0 mt-2 w-56 origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                                                    <div className="px-1 py-1 ">



                                                        <Menu.Item>
                                                            {({ active }) => (
                                                                <button
                                                                    className={`${active ? 'bg-violet-500 text-white' : 'text-gray-900'
                                                                        } group flex w-full items-center rounded-md px-2 py-2 text-sm`}
                                                                >

                                                                    Profile
                                                                </button>
                                                            )}
                                                        </Menu.Item>
                                                    </div>
                                                    <div className="px-1 py-1">
                                                        <Menu.Item>
                                                            {({ active }) => (
                                                                <button
                                                                    className={`${active ? 'bg-violet-500 text-white' : 'text-gray-900'
                                                                        } group flex w-full items-center rounded-md px-2 py-2 text-sm`}
                                                                >

                                                                    Sortir
                                                                </button>
                                                            )}
                                                        </Menu.Item>
                                                    </div>
                                                </Menu.Items>
                                            </Menu>
                                        </td>

                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </div>
     );
}
 
export default Users;