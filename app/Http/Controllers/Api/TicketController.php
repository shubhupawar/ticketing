<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\Attachment;
use Illuminate\Support\Facades\Validator;

class TicketController extends Controller
{
    public function index()
    {
        $tickets = Ticket::with('attachments')
            ->where('user_id', auth()->id())
            ->latest()
            ->get();

        return response()->json($tickets);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject'     => 'required|string|max:255',
            'description' => 'required|string',
            'attachment'  => 'nullable|file|mimes:jpg,png,pdf,docx|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $ticket = Ticket::create([
            'user_id'    => auth()->id(),
            'subject'    => $request->subject,
            'description'=> $request->description,
        ]);

        if ($request->hasFile('attachment')) {
            $file = $request->file('attachment');
            $path = $file->store('uploads', 'public');

            $ticket->attachments()->create([
                'file_path' => $path,
            ]);
        }

        return response()->json([
            'message' => 'Ticket created successfully',
            'ticket'  => $ticket->load('attachments')
        ], 201);
    }

    public function show($id)
    {
        $ticket = Ticket::with(['attachments', 'replies.attachments', 'replies.user'])
            ->where('user_id', auth()->id())
            ->findOrFail($id);

        return response()->json($ticket);
    }

}
