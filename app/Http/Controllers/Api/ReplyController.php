<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\Reply;

class ReplyController extends Controller
{
    public function store(Request $request, $id)
    {
        $ticket = Ticket::findOrFail($id);

        if ($ticket->user_id !== auth()->id()) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $validator = Validator::make($request->all(), [
            'message' => 'required|string',
            'attachment' => 'nullable|file|mimes:jpg,png,pdf,docx|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $reply = Reply::create([
            'ticket_id' => $ticket->id,
            'user_id'   => auth()->id(),
            'message'   => $request->message,
        ]);

        if ($request->hasFile('attachment')) {
            $path = $request->file('attachment')->store('uploads', 'public');

            $reply->attachments()->create([
                'file_path' => $path,
            ]);
        }

        return response()->json([
            'message' => 'Reply added successfully',
            'reply' => $reply->load('attachments')
        ]);
    }
}
