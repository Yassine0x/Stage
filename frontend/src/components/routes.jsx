import {createBrowserRouter} from 'react-router-dom';
import DefaultLayout from '../pages/layout';
import Home from '../pages/acceuil';
import Auth from '../pages/authentification';
import Main from '../pages/admin/main';
import Acceuil from '../pages/admin/acceuilAdmin';
import Produits from '../pages/admin/ProduitsAdmin';
import Orders from '../pages/admin/OrdersAdmin';
import Users from '../pages/admin/Utilisateurs';
import Reaclamation from '../pages/admin/ReclamationsAdmin';
import OrderDetail from '../pages/admin/orderDetail';

const router=createBrowserRouter([
    {
        path:'/',
        element: <DefaultLayout/>,
        children:[
            {
                path:'',
                element: <Home/>
            },{
                path:'login',
                element: <Auth/>
            },
        ]
    },
    {
        path:'/admin',
        element: <Main/>,
        children:[
            {
                path:'',
                element: <Acceuil/>
            },{
                path:'produits',
                element: <Produits/>
            },{
                path:'orders',
                element:<Orders/>
            },{
                path:'orderDetail/:orderId',
                element:<OrderDetail/>
            },{
                path:'user',
                element:<Users/>
            },{
                path:'reclamations',
                element:<Reaclamation/>
            }

        ]
    }
    ])

 
export default router;