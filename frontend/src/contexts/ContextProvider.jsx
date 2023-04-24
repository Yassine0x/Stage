import { createContext, useContext, useState } from "react"
const MyContext =createContext({})
export const ContextProvider = ({children}) =>{
    const [currentUser, _setCurrentUser]=useState(localStorage.getItem('USER') ||{} )
    const [userToken, _setUserToken] = useState(localStorage.getItem('TOKEN') || '')
    console.log(currentUser)
    const setUserToken=(token)=>{
        if (token){
            localStorage.setItem('TOKEN', token)
        }else{
            localStorage.removeItem('TOKEN')
        }
        _setUserToken(token)
    }
    const setCurrentUser=(user)=>{
        if (user){
            localStorage.setItem('USER', JSON.stringify(user))
        }else{
            localStorage.removeItem('USER')
        }
        _setCurrentUser(user)
    }

    return(
        <MyContext.Provider value={{
            currentUser,
            setCurrentUser,
            userToken,
            setUserToken
        }}>
            {children}
        </MyContext.Provider>
    )
}

export const userStateContext = () => useContext(MyContext)