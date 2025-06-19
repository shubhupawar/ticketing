@extends('layouts.app')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
    <h3>Your Tickets</h3>
    <a href="{{ route('tickets.create') }}" class="btn btn-success">+ New Ticket</a>
</div>

@if($tickets->isEmpty())
    <div class="alert alert-info">You have not created any tickets yet.</div>
@else
<table class="table table-bordered">
    <thead>
        <tr>
            <th>#</th>
            <th>Subject</th>
            <th>Created At</th>
            <th>Replies</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach($tickets as $ticket)
        <tr>
            <td>{{ $ticket->id }}</td>
            <td>{{ $ticket->subject }}</td>
            <td>{{ $ticket->created_at->format('d M Y, H:i') }}</td>
            <td>{{ $ticket->replies->count() }}</td>
            <td>
                <a href="{{ route('tickets.show', $ticket) }}" class="btn btn-primary btn-sm">View</a>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endif
@endsection
