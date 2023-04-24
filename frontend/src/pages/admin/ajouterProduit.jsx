import { useEffect, useState } from "react";
import axiosClient from "../../components/axios";


const AjouterProduit = (props) => {

    const [title, setTitle] = useState();
    const [image, setImage] = useState();
    const [description, setDescription] = useState();
    const [quantity, setQuantity] = useState();
    const [price, setPrice] = useState();
    const [category, setCategory] = useState();
    
    useEffect(() => {
        if (props.product){
            setTitle(props.product.title)
            setImage(props.product.image)
            setDescription(props.product.decription)
            setQuantity(props.product.quantity)
            setPrice(props.product.price)
            setCategory(props.product.category)
        }
    }, []);
    
    const handleSubmit = (event) => {
        event.preventDefault()
        // const data = {
        //     image,
        //     title,
        //     description,
        //     quantity,
        //     price,
        //     category
        //   };
        const formData = new FormData();
        formData.append("image", image);
        formData.append("title", title);
        formData.append("decription", description);
        formData.append("quantity", quantity);
        formData.append("price", price);
        formData.append("category", category);
        console.log(formData)
        console.log(title)
        const url = props.product ? `/updateProduct/${props.product.id}` : "/storeProduct";
        const method = props.product ? 'put' : 'post';
        axiosClient({method: method,
            url: url,
            data: formData, 
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        }).then((response)=>{
            if (response.status === 200){
                props.setCount(props.count + 1)
                props.setShow(!props.show)
            }
        }).catch((error) => {
            console.log(error)
        })
    }
    // const Update = (event)=>{
    //     event.preventDefault()
    //     const formUpdate = new FormData();
    //     formUpdate.append('image', image);
    //     formUpdate.append('title', title);
    //     formUpdate.append('decription', description);
    //     formUpdate.append('quantity', quantity);
    //     formUpdate.append('price', price);
    //     formUpdate.append('category', category);
    //     console.log(image);
    //     console.log(formUpdate);
    //     axiosClient.post("/updateProduct/"+props.product.id, formUpdate, {
    //         headers: {
    //             'Content-Type': 'multipart/form-data'
    //         }
    //     }).then((response)=>{
    //         if (response.status === 200){
    //             props.setCount(props.count + 1)
    //             props.setShow(!props.show)
    //         }
    //     }).catch((error) => {
    //         console.log(error)
    //     })
    // }

    return (
        <div className="absolute top-0 h-[100%] w-[100%] justify-center bg-[#222222a6]/50">
            <div>
                <div className="absolute p-5 bg-white w-[600px]  shadow-xl top-32 left-[28%] ">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="1" stroke="currentColor" className="w-8 h-8 absolute top-[-6px] right-[-6px] bg-gray-200 rounded-full cursor-pointer" onClick={() => props.setShow(!props.show)}>
                        <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                    <h2 className="mb-5 pl-5 text-orange-500 text-xl">Creer un nouveau produit</h2>
                    <form className="flex flex-col" onSubmit={handleSubmit} >
                        <input type="text" placeholder="Titre du produit" name="title" className="p-2 m-1 rounded-md px-5 bg-transparent border-2" defaultValue={props.product ? title :''} onChange={(ev) => setTitle(ev.target.value)} />
                        <input type="file" name="image" className="p-2 m-1 rounded-md px-5 bg-transparent border-2" placeholder="image" onChange={(ev) => setImage(ev.target.files[0])} />
                        <textarea cols="30" rows="5" name="description" className="p-2 m-1 border-2 rounded-md" placeholder="description" defaultValue={props.product ? description :''} onChange={(ev) => setDescription(ev.target.value)} ></textarea>
                        <input type="number" placeholder="Prix du produit" name="price" className="p-2 m-1 rounded-md px-5 bg-transparent border-2" defaultValue={props.product ? price :''} onChange={(ev) => setPrice(ev.target.value)} />
                        <input type="number" placeholder="Quantite" name="quantity" className="p-2 m-1 rounded-md px-5 bg-transparent border-2" defaultValue={props.product ? quantity :''} onChange={(ev) => setQuantity(ev.target.value)} />
                        <input type="text" placeholder="category" name="category" className="p-2 m-1 rounded-md px-5 bg-transparent border-2"defaultValue={props.product ? category :''} onChange={(ev) => setCategory(ev.target.value)} />
                        <div>                          
                            <input type="submit" className="p-2 m-1 rounded-md px-5 bg-orange-400 cursor-pointer" />                             
                            <button className="p-2 m-1 rounded-md px-5 cursor-pointer" onClick={() => props.setShow(!props.show)}>annuler</button>
                        </div>                   
                    </form>
                </div>
            </div>
        </div>
    );
}

export default AjouterProduit;