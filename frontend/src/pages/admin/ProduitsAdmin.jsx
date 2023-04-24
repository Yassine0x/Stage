import { useEffect, useState } from "react";
import { useNavigate } from 'react-router-dom';
import AjouterProduit from "./ajouterProduit";
import axiosClient from "../../components/axios";
import { Menu } from "@headlessui/react";


const Produits = () => {
    const [show, setShow] = useState(false);
    const [showUp, setShowUp] = useState(false);
    const [products, setProducts] = useState([]);
    const [updateProduct, setUpdateProduct] = useState([]);
    const [count, setCount] = useState(0)

    useEffect(() => {
        axiosClient.get('/showProducts').then(
            response => {
                setProducts(response.data)

            }
        ).catch((error) => {
            console.log(error);
        })
    }, [count])


    const UpdateShow = (product) => {
        setShowUp(!showUp)
        setUpdateProduct(product)
    }

    const Delete = (id) => {
        //alert("est-vous sure!")
        if (confirm('Est-vous sure ??')) {
            axiosClient.delete('/deleteProduct/' + id).then((response) => {
                if (response.status === 200) {
                    setCount(count + 1)
                }
            })
                .catch((error) => {
                    console.log(error)
                })
        }

    }

    return (
        <div>
            <div className="relative w-[100%] h-[100vh] bg-slate-200">
                <div className="flex justify-between p-7">
                    <div>
                        <h1 className=" text-gray-600 text-2xl font-bold ml-10">Produits</h1>
                    </div>
                    <div className="ml-5">
                        <button className="px-5 py-2 bg-blue-600 rounded-md shadow-lg text-white" onClick={() => setShow(!show)}>Ajouter un produit</button>
                    </div>
                </div>

                {show && <AjouterProduit show={show} setShow={setShow} count={count} setCount={setCount} />
                }
                {showUp && <AjouterProduit show={showUp} setShow={setShowUp} count={count} setCount={setCount} product={updateProduct} />
                }
                <div className="bg-white px-10 py-5 rounded-md m-5">
                    <div>
                        <table width="100%">
                            <thead className=" bg-slate-200 p-20 shadow-sm rounded-md">
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Titre</th>
                                    <th>Prix</th>
                                    <th>Derniere mise a jour</th>
                                    <th>Actions</th>
                                </tr>

                            </thead>
                            <tbody>
                                {products && products.map((product, index) => (
                                    <tr key={index} className="p-5">
                                        <td className="text-center items-center">{product.id}</td>
                                        <td className="text-center items-center"><img src={`http://localhost:8000/${product.image}`} alt="" /></td>
                                        <td className="text-center items-center">{product.title}</td>
                                        <td className="text-center items-center">{product.price}</td>
                                        <td className="text-center items-center">{product.updated_at}</td>
                                        <td className="text-center items-center">
                                            <Menu >
                                                <Menu.Button>
                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="blue" className="w-6 h-6">
                                                        <path strokeLinecap="round" strokeLinejoin="round" d="M12 6.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 12.75a.75.75 0 110-1.5.75.75 0 010 1.5zM12 18.75a.75.75 0 110-1.5.75.75 0 010 1.5z" />
                                                    </svg>


                                                </Menu.Button>
                                                <Menu.Items className="absolute  mt-2 w-40 origin-top divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                                                    <div className="px-1 py-1 ">



                                                        <Menu.Item>
                                                            {({ active }) => (
                                                                <button
                                                                    onClick={() => UpdateShow(product)}
                                                                    className={`${active ? ' bg-blue-500 text-white' : 'text-gray-900'
                                                                        } group flex w-full items-center rounded-md px-2 py-2 text-sm`}
                                                                >
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="w-5 h-5">
                                                                        <path strokeLinecap="round" strokeLinejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125" />
                                                                    </svg>
                                                                    <span className="pl-3">modifier</span>

                                                                </button>
                                                            )}
                                                        </Menu.Item>
                                                    </div>
                                                    <div className="px-1 py-1">
                                                        <Menu.Item>
                                                            {({ active }) => (
                                                                <button
                                                                    onClick={() => Delete(product.id)}
                                                                    className={`${active ? 'bg-blue-500 text-white' : 'text-gray-900'
                                                                        } group flex w-full items-center rounded-md px-2 py-2 text-sm`}
                                                                >
                                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1.5" stroke="currentColor" className="w-5 h-5">
                                                                        <path strokeLinecap="round" strokeLinejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                                                                    </svg>

                                                                    <span className="pl-3">supprimer</span>
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

export default Produits;