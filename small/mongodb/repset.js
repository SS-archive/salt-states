rs.initiate({
    _id : "{{grains['host'].split('-')[1]}}",
    members : [
        { _id : 0, host : "mongorep1-{{grains['host'].split('-')[1]}}.{{grains['domain']}}" },
        { _id : 1, host : "mongorep2-{{grains['host'].split('-')[1]}}.{{grains['domain']}}" },
        { _id : 2, host : "mongorep3-{{grains['host'].split('-')[1]}}.{{grains['domain']}}" },
    ]
})
