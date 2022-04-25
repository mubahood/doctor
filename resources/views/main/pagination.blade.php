@if ($paginator->lastPage() > 1)
<ul class="pagination">

    @if ($paginator->currentPage() != $paginator->onFirstPage())

    <li class="page-item ">
        <a class="page-link {{ ($paginator->currentPage() == 1) ? '  ' : '' }}" href="{{ $paginator->url(1) }}"><i
                class="fas fa-long-arrow-alt-left"></i></a>
    </li>

    @endif


    @for ($i = 1; $i <= $paginator->lastPage(); $i++)
        <li class="page-item ">
            <a class="page-link {{ ($paginator->currentPage() == $i) ? ' active' : '' }}"
                href="{{ $paginator->url($i) }}">{{ $i }}</a>
        </li>
        @endfor
        @if ($paginator->currentPage() != $paginator->lastPage())

        <li class="page-item ">
            <a class="page-link {{ ($paginator->currentPage() == $paginator->lastPage()) ? ' disabled' : '' }}"
                href="{{ $paginator->url($paginator->currentPage()+1) }}"><i
                    class="fas fa-long-arrow-alt-right"></i></a>
        </li>
        @endif
</ul>
@endif

{{-- <ul class="pagination">
    <li class="page-item">
        <a class="page-link" href="#"></a>
    </li>
    <li class="page-item"><a class="page-link active" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">...</li>
    <li class="page-item">
        <ahref="#">67</a>
    </li>
    <li class="page-item"><a class="page-link" href="#"></a></li>
</ul> --}}