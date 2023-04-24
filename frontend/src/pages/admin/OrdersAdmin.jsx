import { useEffect, useState } from "react";
import axiosClient from "../../components/axios";
import { NavLink } from "react-router-dom";

const Orders = () => {
    const [orders, setOrders] = useState([]);
    
    useEffect(() => {
        axiosClient.get('/showOrders').then(
            response => {
                setOrders(response.data)
                
            }
        ).catch((error) => {
            console.log(error);
        })
    }, [])


    return (
        <div>
            <div className="relative w-[100%] h-[100vh] bg-slate-200">
                <div className="flex justify-between p-7">
                    <div>
                        <h1 className=" text-gray-600 text-2xl font-bold ml-10">Orders</h1>
                    </div>
                    
                </div>

                <div className="bg-white px-10 py-5 rounded-md m-5">
                    <div>
                        <table width="100%">
                            <thead className=" bg-slate-200 p-20 shadow-sm rounded-md">
                                <th>ID</th>
                                <th>Client</th>
                                <th>Quantite</th>
                                <th>Prix</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </thead>
                            <tbody>
                                {orders && orders.map((order, index) => (
                                    <tr key={index} className="p-5">
                                        <td className="text-center items-center">{order.id}</td>
                                        <td className="text-center items-center">{order.user_id}</td>
                                        <td className="text-center items-center">{order.quantity}</td>
                                        <td className="text-center items-center">{order.total}</td>
                                        <td className="text-center items-center">{order.status}</td>
                                        <td className="text-center items-center">
                                            <button className="bg-blue-600 px-4 py-2 rounded-xl"><NavLink to={'/admin/orderDetail/'+order.id}>Details</NavLink></button>
                                        </td>

                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>


        </div>
    );}
 
export default Orders;