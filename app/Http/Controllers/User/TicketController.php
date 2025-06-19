<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Models\Attachment;
use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\Reply;

class TicketController extends Controller
{
    public function index()
    {
        $tickets = Ticket::where('user_id', Auth::id())->latest()->get();
        return view('tickets.index', compact('tickets'));
    }

    public function create()
    {
        return view('tickets.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'subject' => 'required|string|max:255',
            'description' => 'required|string',
            'attachment' => 'nullable|file|mimes:jpg,png,pdf,docx|max:2048'
        ]);

        $ticket = Ticket::create([
            'user_id' => auth()->id(),
            'subject' => $request->subject,
            'description' => $request->description,
        ]);

        if ($request->hasFile('attachment')) {
            $path = $request->file('attachment')->store('uploads', 'public');
            $ticket->attachments()->create(['file_path' => $path]);
        }

        return redirect()->route('dashboard')->with('success', 'Ticket created successfully!');
    }

    public function show(Ticket $ticket)
    {
        abort_if($ticket->user_id !== auth()->id(), 403);
        $ticket->load(['replies.user', 'attachments', 'replies.attachments']);
        return view('tickets.show', compact('ticket'));
    }

    public function reply(Request $request, Ticket $ticket)
    {
        abort_if($ticket->user_id !== auth()->id(), 403);

        $request->validate([
            'message' => 'required|string',
            'attachment' => 'nullable|file|mimes:jpg,png,pdf,docx|max:2048'
        ]);

        $reply = $ticket->replies()->create([
            'user_id' => auth()->id(),
            'message' => $request->message,
        ]);

        if ($request->hasFile('attachment')) {
            $path = $request->file('attachment')->store('uploads', 'public');
            $reply->attachments()->create(['file_path' => $path]);
        }

        return redirect()->route('tickets.show', $ticket)->with('success', 'Reply added.');
    }
}
