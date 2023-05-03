<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Product extends Controller
{
    public function process()
    {
        $AuthUser           = $this->getVariable("AuthUser");
        $Route              = $this->getVariable("Route"); 
        $Config['nav']      = 'store';

        if(Input::cleaner($Route->params->id)) {
            $Listing        = $this->db->from('store')->where('id',$Route->params->id,'=')->first();
            $Data           = json_decode($Listing['data'], true);
        }

        $this->setVariable("Config",$Config);    
        $this->setVariable('Listing',$Listing); 
        $this->setVariable('Data',$Data); 
        if(Input::cleaner($_POST['_ACTION']) == 'save' AND !$Listing['id']) {
            $this->save();
        } elseif(Input::cleaner($_POST['_ACTION']) == 'save' AND $Listing['id']) {
            $this->update();
        }

        $this->view('product', 'admin');
    }

    public function save() { 
        if (empty($Notify)) {  
 
            $dataarray          = array(
                "product"          => Input::cleaner($_POST['product']),
                "description"          => $_POST['description'],
                "image"          => Input::cleaner($_POST['image']),
                "price"         => Input::cleaner($_POST['price']),
                "return_url"         => Input::cleaner($_POST['return_url'])
            );   
            $this->db->insert('store')->set($dataarray); 
            $Notify['type']     = 'success';
            $Notify['text']     = __('Changes Saved'); 
            $this->notify($Notify);
            header("location: ".APP.'/admin/store');
        }else{ 
            $this->notify($Notify);
        }
        return $this;
    }
    public function update() {
        $Listing        = $this->getVariable("Listing");       
        if (empty($Notify)) {


            $dataarray          = array(
                "product"          => Input::cleaner($_POST['product']),
                "description"          => $_POST['description'],
                "image"          => Input::cleaner($_POST['image']),
                "price"         => Input::cleaner($_POST['price']),
                "return_url"         => Input::cleaner($_POST['return_url'])
            );   
            $this->db->update('store')->where('id',$Listing['id'])->set($dataarray);
            $Notify['type']     = 'success';
            $Notify['text']     = __('Changes Saved'); 
            $this->notify($Notify);
            header("location: ".APP.'/admin/store');
        }else{ 
            $this->notify($Notify);
        } 
        return $this;
    }
}
