<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    protected $redirectTo = '/website'; 

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function index()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
    
        $user = User::where('email', $request->email)->first();
    
        if (!$user) {
            return redirect()->route('login')->withErrors(['email' => 'Invalid credentials']);
        }
    
        if (Auth::attempt($request->only('email', 'password'))) {
            return redirect()->intended($this->redirectTo)->with('success', 'Login successful!');
        }
    
        return redirect()->route('login')->withErrors(['password' => 'Incorrect password'])->withInput();
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        return redirect('/')->with('message', 'You are now logged out.');
    }
}
