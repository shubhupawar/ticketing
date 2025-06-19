@extends('layouts.app')

@section('content')
<h3>Ticket: {{ $ticket->subject }}</h3>
<p><strong>Description:</strong> {{ $ticket->description }}</p>

@if($ticket->attachments->count())
    <p><strong>Attachments:</strong></p>
    <ul>
        @foreach($ticket->attachments as $attachment)
            <li><a href="{{ url('public/storage/' . $attachment->file_path) }}" target="_blank">Download</a></li>
        @endforeach
    </ul>
@endif

<hr>

<h5>Replies ({{ $ticket->replies->count() }})</h5>
@forelse($ticket->replies as $reply)
    <div class="border p-2 mb-2">
        <p>{{ $reply->message }}</p>
        <small>By: {{ $reply->user->name }} — {{ $reply->created_at->diffForHumans() }}</small>
        @if($reply->attachments->count())
            <p class="mt-1"><strong>Attachment:</strong>
                @foreach($reply->attachments as $attach)
                    <a href="{{ url('public/storage/' . $attach->file_path) }}" target="_blank">Download</a>
                @endforeach
            </p>
        @endif
    </div>
@empty
    <p>No replies yet.</p>
@endforelse

<hr>

<h5>Add a Reply</h5>
<form method="POST" action="{{ route('tickets.reply', $ticket) }}" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label>Message</label>
        <textarea name="message" class="form-control" required></textarea>
    </div>
    <div class="mb-3">
        <label>Attachment (optional)</label>
        <input type="file" name="attachment" class="form-control">
    </div>
    <button class="btn btn-primary">Submit Reply</button>
</form>
@endsection
