@extends('layouts.app')

@section('content')
<h3>Create New Ticket</h3>

<form method="POST" action="{{ route('tickets.store') }}" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
        <label>Subject</label>
        <input type="text" name="subject" class="form-control" required value="{{ old('subject') }}">
    </div>
    <div class="mb-3">
        <label>Description</label>
        <textarea name="description" class="form-control" rows="4" required>{{ old('description') }}</textarea>
    </div>
    <div class="mb-3">
        <label>Attachment (optional)</label>
        <input type="file" name="attachment" class="form-control">
        <div class="form-text">Allowed: jpg, png, pdf, docx — Max: 2MB</div>
    </div>
    <button class="btn btn-primary">Submit Ticket</button>
    <a href="{{ route('dashboard') }}" class="btn btn-secondary">Cancel</a>
</form>
@endsection
