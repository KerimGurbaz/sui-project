module suiProject::messenger{
    use std::string::String;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct Admin has key{
        id:UID,
    }
    
    struct Messenger has key{
        id:UID;
        name:String,
        message:String,
        from: address,
        to:address,

    }

    public entry fun create_messenger(name:vector<u8>, messaage:vector<u8>, to:address, ctx:&mut txContext){
        let messenger= Messenger{
            id:object::new(ctx),
            name:string::utf8(name),
            message:string::utf8(message),
            from: tx_context::sender(ctx),
            to,
        };

        transfer::transfer(messenger, tx_context::sender(ctx));
    }

    fun init(ctx: &mut TxContext){
        transfer::transfer(Admin(id:object::new(ctx)), tx_context::sender(ctx));
    }
}