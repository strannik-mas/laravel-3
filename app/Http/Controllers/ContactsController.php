<?php

namespace Corp\Http\Controllers;

use Corp\Repositories\MenusRepository;
use Illuminate\Http\Request;
use Mail;

class ContactsController extends SiteController
{
    //25 урок
    public function __construct()
    {
        parent::__construct(new MenusRepository(new \Corp\Menu));
        $this->bar='left';
        $this->template = env('THEME') . '.contacts';
    }

    public function index(Request $request)
    {
        $messages = [
            'required' => 'Поле :attribute обязательно к заполнению',
            'email' => 'поле :attribute тут должен быть мыло'
        ];


        if ($request->isMethod('post')) {
            $this->validate($request, [
                'name' => 'required|max:255',
                'email' => 'required|email',
                'message' => 'required',
            ], $messages);

            $data = $request->all();
            Mail::send(env('THEME').'.email', ['data' => $data], function ($message) use ($data) {
                $mail_admin = env('MAIL_ADMIN');
                $message->from($data['email'], $data['name']);
                $message->to($mail_admin, '')->subject('question');
                return redirect()->route('contacts')->with('status', 'Email is send');
            });
        }

        $this->title = 'Контакты';
        $content  = view(env('THEME').'.contact_content')->render();
        $this->vars = array_add($this->vars, 'content',$content);

        $this->contentLeftBar = view(env('THEME').'.contact_bar')->render();

        return $this->renderOutput();
    }
}
