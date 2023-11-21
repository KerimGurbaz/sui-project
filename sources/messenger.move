module sui-project::messenger{
    use std::string::String;
    use sui::object::{Self, UID};
    
    struct Messenger has key{
        id:UID;
        name:String,
        message:String,
        from: address,
        to:address,

    }
}