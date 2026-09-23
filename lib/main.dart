import 'package:flutter/material.dart';

void main() => runApp(const ServizoApp());

class ServizoApp extends StatelessWidget {
  const ServizoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servizo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D806D)),
        scaffoldBackgroundColor: const Color(0xFFF6F8F4),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
      home: const _RoleSelection(),
    );
  }
}

class _RoleSelection extends StatelessWidget {
  const _RoleSelection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD7EEE7),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.handyman_outlined,
                    size: 52,
                    color: Color(0xFF0D806D),
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Welcome to Servizo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF14231F),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Good to see you. Tell us how you want to use Servizo today.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const SizedBox(height: 34),
                _RoleButton(
                  icon: Icons.person_search_outlined,
                  title: 'Servizo Customer',
                  subtitle: 'Find trusted service professionals nearby',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const WorkLinkHome(),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                _RoleButton(
                  icon: Icons.engineering_outlined,
                  title: 'Servizo Service Man',
                  subtitle: 'Receive jobs and grow your local work',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const _ServiceManHome(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  const _RoleButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: const Color(0xFF0D806D)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

class _ServiceManHome extends StatelessWidget {
  const _ServiceManHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Servizo Service Man')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Welcome, Ravi',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          const Text(
            'Find nearby work and keep your schedule full.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF123F36),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s earnings',
                        style: TextStyle(color: Color(0xFFB9DAD0)),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '₹1,250',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.trending_up, color: Color(0xFFB9E1D0), size: 36),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'Available job requests',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          _ServiceManJob(
            title: 'Electrician needed',
            location: 'HSR Layout  •  Today, 2:00 PM',
            amount: '₹249 + visit charge',
          ),
          _ServiceManJob(
            title: 'RO purifier service',
            location: 'Koramangala  •  Tomorrow, 10:00 AM',
            amount: '₹399 + visit charge',
          ),
        ],
      ),
    );
  }
}

class _ServiceManJob extends StatelessWidget {
  const _ServiceManJob({
    required this.title,
    required this.location,
    required this.amount,
  });

  final String title;
  final String location;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE8F3EF),
          child: Icon(Icons.handyman, color: Color(0xFF0D806D)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text('$location\n$amount'),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class Service {
  const Service(this.name, this.icon, this.color, this.price);
  final String name;
  final IconData icon;
  final Color color;
  final String price;
}

const services = <Service>[
  Service(
    'Home cleaning',
    Icons.cleaning_services,
    Color(0xFFDFF3E6),
    'From ₹2500',
  ),
  Service('Electrician', Icons.bolt, Color(0xFFFFEBC7), 'From ₹249'),
  Service('Plumbing', Icons.water_drop, Color(0xFFDDEDF8), 'From ₹299'),
  Service(
    'Appliance repair',
    Icons.home_repair_service,
    Color(0xFFF5E2DA),
    'From ₹500',
  ),
  Service('Painting', Icons.format_paint, Color(0xFFE9E1F7), 'From ₹799'),
  Service('Moving help', Icons.local_shipping, Color(0xFFF6E5C9), 'From ₹599'),
  Service('Pest control', Icons.bug_report, Color(0xFFE8F3EF), 'From ₹399'),
  Service('Carpentry', Icons.chair, Color(0xFFFDE2E2), 'From ₹499'),
  Service('Ro water purifier', Icons.water, Color(0xFFE1F3F9), 'From ₹1500'),
];

class WorkLinkHome extends StatefulWidget {
  const WorkLinkHome({super.key});
  @override
  State<WorkLinkHome> createState() => _WorkLinkHomeState();
}

class _WorkLinkHomeState extends State<WorkLinkHome> {
  int _tab = 0;
  Service? _selectedService;
  String _jobStatus = 'New request';

  void _book(Service service) => setState(() {
    _selectedService = service;
    _jobStatus = 'New request';
    _tab = 1;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _tab,
          children: [
            _CustomerView(onBook: _book),
            _BookingsView(
              service: _selectedService,
              status: _jobStatus,
              onStatusChanged: (status) => setState(() => _jobStatus = status),
            ),
            const _ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'My jobs',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _CustomerView extends StatelessWidget {
  const _CustomerView({required this.onBook});
  final ValueChanged<Service> onBook;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFFD7EEE7),
                      child: Icon(Icons.person, color: Color(0xFF0D806D)),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning, Alex',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Near HSR Layout, Bengaluru',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF123F36),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reliable help,\nright at home.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                height: 1.15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Book trusted local professionals in minutes.',
                              style: TextStyle(
                                color: Color(0xFFB9DAD0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.handyman_outlined,
                        size: 64,
                        color: Color(0xFFB9E1D0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const Text(
                'What can we help with?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF14231F),
                ),
              ),
              const SizedBox(height: 14),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a service',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                ),
              ),
              const SizedBox(height: 22),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular services',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xFF0D806D),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.18,
                ),
                itemBuilder: (context, index) => _ServiceCard(
                  service: services[index],
                  onTap: () => onBook(services[index]),
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                'Why people choose WorkLink',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: _TrustItem(
                      icon: Icons.verified_user_outlined,
                      title: 'Verified pros',
                    ),
                  ),
                  Expanded(
                    child: _TrustItem(
                      icon: Icons.schedule,
                      title: 'On-time service',
                    ),
                  ),
                  Expanded(
                    child: _TrustItem(
                      icon: Icons.payments_outlined,
                      title: 'Fair pricing',
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service, required this.onTap});
  final Service service;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: service.color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(service.icon, size: 28, color: const Color(0xFF193D35)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 3),
                Text(
                  service.price,
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  const _TrustItem({required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Icon(icon, color: const Color(0xFF0D806D)),
      const SizedBox(height: 6),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 11, color: Colors.black54),
      ),
    ],
  );
}

class _BookingsView extends StatelessWidget {
  const _BookingsView({
    required this.service,
    required this.status,
    required this.onStatusChanged,
  });
  final Service? service;
  final String status;
  final ValueChanged<String> onStatusChanged;
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
    children: [
      const Text(
        'My jobs',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Color(0xFF14231F),
        ),
      ),
      const SizedBox(height: 6),
      Text(
        service != null
            ? 'Track your active service request'
            : 'Your booked services will appear here',
        style: const TextStyle(color: Colors.black54),
      ),
      const SizedBox(height: 24),
      if (service == null)
        const _EmptyJobs()
      else
        _JobCard(
          service: service!,
          status: status,
          onStatusChanged: onStatusChanged,
        ),
    ],
  );
}

class _JobCard extends StatelessWidget {
  const _JobCard({
    required this.service,
    required this.status,
    required this.onStatusChanged,
  });
  final Service service;
  final String status;
  final ValueChanged<String> onStatusChanged;
  @override
  Widget build(BuildContext context) {
    final active = status != 'Completed';
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE1E8E3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service.color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(service.icon, color: const Color(0xFF193D35)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Today, 2:00 PM  -  HSR Layout',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              _StatusChip(status: status),
            ],
          ),
          const Divider(height: 30),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7E7),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(Icons.directions_car_outlined, color: Color(0xFF956213)),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Site visit charge',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Applied when the technician visits your site',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Text(
                  '₹99',
                  style: TextStyle(
                    color: Color(0xFF956213),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFE8F3EF),
                child: Icon(Icons.engineering, color: Color(0xFF0D806D)),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Technician assigned',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Ravi Kumar  -  4.9 stars',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Chat')),
            ],
          ),
          const SizedBox(height: 14),
          if (active)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => onStatusChanged(
                  status == 'New request' ? 'On the way' : 'Completed',
                ),
                icon: Icon(
                  status == 'New request'
                      ? Icons.check_circle_outline
                      : Icons.done_all,
                ),
                label: Text(
                  status == 'New request'
                      ? 'Accept technician'
                      : 'Mark work complete',
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});
  final String status;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
    decoration: BoxDecoration(
      color: status == 'Completed'
          ? const Color(0xFFE3F3E8)
          : const Color(0xFFFFF1D8),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: status == 'Completed'
            ? const Color(0xFF287544)
            : const Color(0xFF956213),
      ),
    ),
  );
}

class _EmptyJobs extends StatelessWidget {
  const _EmptyJobs();
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Column(
      children: [
        Icon(Icons.handyman_outlined, size: 52, color: Color(0xFF85B9A9)),
        SizedBox(height: 14),
        Text(
          'No jobs yet',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 6),
        Text(
          'Choose a service from Discover to get started.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
      ],
    ),
  );
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(20, 26, 20, 24),
    children: [
      const Text(
        'Profile',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Color(0xFF14231F),
        ),
      ),
      const SizedBox(height: 22),
      const ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xFFD7EEE7),
          child: Icon(Icons.person, color: Color(0xFF0D806D)),
        ),
        title: Text(
          'Servizo Host: Shaik Khasim',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        subtitle: Text('khasimshaik05051@gmail.com'),
      ),
      const Divider(height: 32),
      const _ProfileTile(
        icon: Icons.location_on_outlined,
        label: 'Saved addresses',
      ),
      const _ProfileTile(
        icon: Icons.credit_card_outlined,
        label: 'Payment methods',
      ),
      _ProfileTile(
        icon: Icons.help_outline,
        label: 'Help & support',
        onTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (_) => const _SupportView())),
      ),
      const _ProfileTile(icon: Icons.settings_outlined, label: 'App settings'),
    ],
  );
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(icon, color: const Color(0xFF0D806D)),
    title: Text(label),
    trailing: const Icon(Icons.chevron_right),
    onTap: onTap,
  );
}

class _SupportView extends StatelessWidget {
  const _SupportView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & support')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F3EF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.support_agent, color: Color(0xFF0D806D), size: 30),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'We are sorry you are facing trouble with Servizo. We are here to help and will do our best to resolve your issue.',
                    style: TextStyle(height: 1.4, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'Contact the Servizo host',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Color(0xFFD7EEE7),
              child: Icon(Icons.person, color: Color(0xFF0D806D)),
            ),
            title: Text(
              'Shaik Khasim',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Text('Servizo Host'),
          ),
          const SizedBox(height: 8),
          SelectableText(
            'khasimshaik05051@gmail.com',
            style: TextStyle(
              color: Color(0xFF0D806D),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'When contacting support, please include your name, phone number, booking details, and a short description of the problem.',
            style: TextStyle(color: Colors.black54, height: 1.4),
          ),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.email_outlined),
            label: const Text('Email Servizo support'),
          ),
        ],
      ),
    );
  }
}
