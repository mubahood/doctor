<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Chat extends Model
{
    use HasFactory;
    protected $fillable = [
        'thread',
        'sender',
        'receiver',
        'product_id',
        'seen',
        'received',
        'body'
    ];

    public function getSenderNameAttribute($value)
    {
        $s =  User::find($this->sender);
        if ($s == null) {
            return "User $this->sender";
        } else {
            return $s->name;
        }
    }

    public function getReceiverNameAttribute($value)
    {
        $s =  User::find($this->receiver);
        if ($s == null) {
            return "User {$this->receiver}";
        } else {
            return $s->name;
        }
    }


    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->diffForHumans();
    }

    public function getProductNameAttribute($value)
    {
        $p =  Product::find($this->product_id);
        if ($p == null) {
            return "Product {$this->product_id}";
        } else {
            return $p->name;
        }
    }

    public function getProductPicAttribute($value)
    {
        $p =  Product::find($this->product_id);
        if ($p == null) {
            return "";
        } else {
            return $p->thumbnail;
        }
    }

    public function _sender()
    {
        return $this->belongsTo(User::class, "sender");
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }




    public static  function get_chat_thread($thread, $user_id, $unread)
    {
        $per_page = 1000;

        $thread = trim($thread);
        $unread = trim($unread);

        $received = false;
        if ($unread != "1") {
            $received = false;
        } else {
            $received = true;
        }
        $user_id = trim($user_id);
        if (strlen($thread) < 1) {
            return [];
        }
        $_items = Chat::where([
            'thread' => $thread,
            'received' => $received,
        ])->paginate($per_page)->withQueryString()->items();

        $items = [];
        foreach ($_items as $key => $value) {
            $value->file = "0";



            if ($value->receiver == $user_id) {
                $value->seen = 1;
                $value->received = 1;
                $value->update();
            }

            if ($received == 1) {
                if ($value->receiver == $user_id) {
                    $items[] = $value;
                }
            } else {
                $items[] = $value;
            }
        }
        return $items;
    }

    public static  function get_chat_threads($user_id)
    {
        if ($user_id < 0) {
            return [];
        }

        $chats = [];
        $threads = Chat::where('sender', $user_id)
            ->orWhere('receiver', $user_id)
            ->distinct()
            ->get(['thread']);

        foreach ($threads as $key => $value) {
            $c = Chat::where(['thread' => $value->thread])
                ->orderBy('id', 'desc')
                ->first();

            $c->unread_count = Chat::where('thread', $value->thread)
                ->where('sender', '!=', $user_id)
                ->where('seen', false)
                ->count();
            $c->file = '1';
            $c->display_name = "";
            $c->display_photo = "";
            if ($user_id == $c->sender) {
                $c->display_name = $c->receiver_name;
                $c->display_photo = $c->receiver_pic;
            } else {
                $c->display_name = $c->sender_name;
                $c->display_photo = $c->sender_pic;
            }

            $chats[] = $c;
        }
        return $chats;
    }



    public static function get_chat_thread_product_id($thread_id)
    {
        if ($thread_id == null) {
            return 0;
        }
        $vals = explode('-', $thread_id);
        if (isset($vals[2])) {
            return ((int)($vals[2]));
        } else {
            return 0;
        }
    }
    public static function get_chat_thread_id($sender, $receiver, $product)
    {
        if ($sender == $receiver) {
            return null;
        }
        $thread = $sender . "-" . $receiver . "-" . $product;

        $results = DB::select(
            'select * from chats where 
                (sender = :sender AND
                receiver = :receiver AND
                product_id = :product)
                OR 
                (sender = :_receiver AND
                receiver = :_sender AND
                product_id = :_product) 
                ',
            [
                'sender' => $sender,
                'receiver' => $receiver,
                'product' => $product,
                '_sender' => $sender,
                '_receiver' => $receiver,
                '_product' => $product
            ]
        );
        if (
            $results != null &&
            !empty($results)
        ) {
            $thread = $results[0]->thread;
        }

        return $thread;
    }
}
